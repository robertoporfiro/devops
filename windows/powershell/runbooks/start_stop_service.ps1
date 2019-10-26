param(     
    [parameter(Mandatory=$false)] 
    [string] $resource_group_name = "INSIGHTS_MP_PROD",

    [parameter(Mandatory=$false)] 
    [string] $server_name = "insightsmpms",

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
                                    ,StartTime: ""08:50:00""
                                    ,StopTime: ""09:25:00""
                                    ,Sku: ""S0""
                                }  
                            ]
                          "
)

filter timestamp {"[$(Get-Date -Format G)]: $_"}

Write-Output "Script started with UTC zone." | timestamp
Write-Output "Parameters: $resource_group_name,`
                          $server_name,`
                          $configStr,`
                          $azureProfilePath,`
                          $azureRunAsConnectionName" | timestamp

# Get current date/time and convert time zone
$stateConfig = $configStr | ConvertFrom-Json
$startTime = Get-Date

Write-Output "Azure Automation local time: $startTime." | timestamp
$toTimeZone = [System.TimeZoneInfo]::FindSystemTimeZoneById($serviceTimeZone)
Write-Output "Time zone convert to: $toTimeZone." | timestamp
$newTime = [System.TimeZoneInfo]::ConvertTime($startTime, $toTimeZone)
Write-Output "Converted time: $newTime." | timestamp
$startTime = $newTime

# Get current day of week based on converted start time
$currentDayOfWeek = [Int]($startTime).DayOfWeek
Write-Output "Current day of week: $currentDayOfWeek." | timestamp

$VerbosePreference = "Continue"
$ErrorActionPreference = "Stop"
Import-Module "AzureRM.AnalysisServices"

# ---
# Load the profile from local file
Write-Output "Logging in to Azure..." | timestamp
if (-not [string]::IsNullOrEmpty($azureProfilePath)){    
    Import-AzureRmContext -Path $azureProfilePath | Out-Null
}
# Load the profile from Azure Automation RunAS connection
else {
    $runAsConnectionProfile = Get-AutomationConnection -Name $azureRunAsConnectionName      

    Add-AzureRmAccount -ServicePrincipal `
                       -TenantId $runAsConnectionProfile.TenantId `
                       -ApplicationId $runAsConnectionProfile.ApplicationId `
                       -CertificateThumbprint $runAsConnectionProfile.CertificateThumbprint | Out-Null
    
    Write-Output "Authenticated with Automation Account." | timestamp
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
$asServer = Get-AzureRmAnalysisServicesServer -Res $resource_group_name `
                                              -Name $server_name

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
    }else {
        Write-Output "Server paused. Exiting..." | timestamp
        if($asServer.State -eq "Succeeded"){
            $asServer | Suspend-AzureRmAnalysisServicesServer -Verbose
        } 
    }
}else {
    Write-Output "No object config for current day of week" | timestamp
    if($asServer.State -eq "Succeeded") {
        $asServer | Suspend-AzureRmAnalysisServicesServer -Verbose
    }         
}

Write-Output "--- Script finished ---" | timestamp
