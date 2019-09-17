<#
 .DESCRIPTION
    Create a runbook to Azure Analysis Services

 .PARAMETER resourceGroupName

 .PARAMETER serverName

 .PARAMETER azureProfilePath

 .PARAMETER azureRunAsConnectionName

 .PARAMETER serviceTimeZone
#>

param(     
    [parameter(Mandatory=$false)] 
    [string] $resourceGroupName = "<name_resource>",

    [parameter(Mandatory=$false)] 
    [string] $serverName = "<name>",

    [parameter(Mandatory=$false)] 
    [string] $azureProfilePath  = "",

    [parameter(Mandatory=$false)] 
    [string] $azureRunAsConnectionName = "AzureRunAsConnection",

    [parameter(Mandatory=$false)]
    [string] $serviceTimeZone = "E. South America Standard Time",

    [parameter(Mandatory=$false)]
    [string] $configStr = "
                            [
                                {
                                    WeekDays:[1,2,3,4,5]	
                                    ,StartTime: ""09:00:00""
                                    ,StopTime: ""18:00:00""
                                    ,Sku: ""S0""
                                }  
                            ]
                          "
)


#******************************************************************************
# Script body
# Execution begins here
#******************************************************************************
Write-Output "Script started with UTC zone." | timestamp
Write-Output "Parameters: $resourceGroupName,`
                          $serverName,`
                          $configStr,`
                          $azureProfilePath,`
                          $azureRunAsConnectionName" | timestamp

#Get current date/time and convert time zone
$stateConfig = $configStr | ConvertFrom-Json
$startTime = Get-Date

Write-Output "Azure Automation local time: $startTime." | timestamp
$toTimeZone = [System.TimeZoneInfo]::FindSystemTimeZoneById($serviceTimeZone)
Write-Output "Time zone convert to: $toTimeZone." | timestamp
$newTime = [System.TimeZoneInfo]::ConvertTime($startTime, $toTimeZone)
Write-Output "Converted time: $newTime." | timestamp
$startTime = $newTime

#Get current day of week based on converted start time
$currentDayOfWeek = [Int]($startTime).DayOfWeek
Write-Output "Current day of week: $currentDayOfWeek." | timestamp

filter timestamp {"[$(Get-Date -Format G)]: $_"}


Write-Output "Parameters: $resourceGroupName,`
                          $serverName,`
                          $configStr,`
                          $azureProfilePath,`
                          $azureRunAsConnectionName" | timestamp


$VerbosePreference = "Continue"
$ErrorActionPreference = "Stop"
Import-Module "AzureRM.AnalysisServices"


# Sign in
Write-Output "Logging in to Azure..." | timestamp

if (-not [string]::IsNullOrEmpty($azureProfilePath)){    
    Import-AzureRmContext -Path $azureProfilePath | Out-Null
}
# Load the profile from Azure Automation RunAS connection
elseif (-not [string]::IsNullOrEmpty($azureRunAsConnectionName)){
    $runAsConnectionProfile = Get-AutomationConnection -Name $azureRunAsConnectionName      

    Add-AzureRmAccount -ServicePrincipal `
                       -TenantId $runAsConnectionProfile.TenantId `
                       -ApplicationId $runAsConnectionProfile.ApplicationId `
                       -CertificateThumbprint $runAsConnectionProfile.CertificateThumbprint | Out-Null
    
    Write-Output "Authenticated with Automation Account." | timestamp
}
# Interactive Login
else{
    Add-AzureRmAccount | Out-Null
}


# Find a match in the config
$dayObjects = $stateConfig | Where-Object {$_.WeekDays -contains $currentDayOfWeek } `
    | Select-Object Sku, `
     @{Name = "StartTime"; `
     Expression = {[datetime]::ParseExact($_.StartTime,"HH:mm:ss",`
                                         [System.Globalization.CultureInfo]::InvariantCulture)}},`
                                         @{ Name="StopTime";`
                                         Expression = {[datetime]::ParseExact($_.StopTime,"HH:mm:ss",`
                                                                             [System.Globalization.CultureInfo]::InvariantCulture)}}

# Get the server status
$asServer = Get-AzureRmAnalysisServicesServer -ResourceGroupName $resourceGroupName `
                                              -Name $serverName
Write-Output "Azure Analysis Services STATUS: $($asServer.State)" | timestamp


# If not match any day then exit
if($dayObjects -ne $null) {
    # Can't treat several objects for same time-frame, if there's more than one, pick first
    $matchingObject = $dayObjects | Where-Object { 
                                                    ($startTime -ge $_.StartTime) `
                                                                -and ($startTime -lt $_.StopTime) } | Select-Object -First 1

    if($matchingObject -ne $null) {
        # if Paused resume
        if($asServer.State -eq "Paused") {
            $asServer | Resume-AzureRmAnalysisServicesServer -Verbose
            Write-Output "resuming..." | timestamp
        }
        
        # Change the SKU if needed
        if($asServer.Sku.Name -ne $matchingObject.Sku) {
            Write-Output "Updating AAS server from $($asServer.Sku.Name) to $($matchingObject.Sku)" | timestamp

            #$asServer | Set-AzureRmAnalysisServicesServer -Sku $matchingObject.Sku
            Set-AzureRmAnalysisServicesServer -Name $asServer.Name `
                                              -ResourceGroupName $resourceGroupName `
                                              -Sku $matchingObject.Sku `
                                              -Verbose
        }        
    }
    else {
        Write-Output "Server paused already. Exiting..." | timestamp

        if($asServer.State -eq "Succeeded"){
            $asServer | Suspend-AzureRmAnalysisServicesServer -Verbose
        } 
    }
}
else {
    Write-Output "No object config for current day of week" | timestamp
    
    if($asServer.State -eq "Succeeded") {
        $asServer | Suspend-AzureRmAnalysisServicesServer -Verbose
    }         
}

Write-Output "Script finished." | timestamp
