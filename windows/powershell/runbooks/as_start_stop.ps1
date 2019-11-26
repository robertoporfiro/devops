param(     
    [parameter(Mandatory=$false)] 
    [string] $ResourceGroupName = "",

    [Parameter(Mandatory=$false)]  
    [String]$NameUser = "application_user",

    [parameter(Mandatory=$false)] 
    [string] $ServerName = "",

    [parameter(Mandatory=$false)]
    [string] $serviceTimeZone = "E. South America Standard Time",

    [parameter(Mandatory=$false)]
    [string] $AutomationAccountName = "",

    [parameter(Mandatory=$false)]
    [string] $RunbookNameEmail = "send_email",

    [parameter(Mandatory=$false)]
    [string] $RunbookNameAddAccount = "add_authenticated_account",
    
    [parameter(Mandatory=$false)]
    [string] $configStr = "
                            [
                                {
                                    WeekDays:[1,2,3,4,5]	
                                    ,StartTime: ""09:00:00""
                                    ,StopTime: ""09:30:00""
                                    ,Sku: ""S0""
                                }  
                            ]
                          "
)

# Log
Write-Output "Parameters: $ResourceGroupName, `
                          $ServerName, `
                          $configStr "

# Set action if error
$ErrorActionPreference = "Stop"

#*****************************************************************************
# Set Timestamp
#*****************************************************************************
# Get current date/time and convert time zone
filter timestamp {"[$(Get-Date -Format G)]: $_"}

Write-Output "Handling time zone" | timestamp
Write-Output "Script started with UTC zone." | timestamp
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

# Find a match in the config
$dayObjects = $stateConfig `
    | Where-Object {$_.WeekDays -contains $currentDayOfWeek} `
    | Select-Object Sku, `
    @{ Name = "StartTime"; `
    Expression = {
        [datetime]::ParseExact($_.StartTime,"HH:mm:ss", [System.Globalization.CultureInfo]::InvariantCulture)}}, `
    @{ Name = "StopTime";`
    Expression = {
        [datetime]::ParseExact($_.StopTime,"HH:mm:ss", [System.Globalization.CultureInfo]::InvariantCulture)}}

#******************************************************************************
# Logging in to Azure
#******************************************************************************
Write-Output "Logging in to Azure..." | timestamp
try {

    # Ensures that any credentials apply only to the execution of this runbook
    Disable-AzureRmContextAutosave -Scope Process

    # Connect to Azure with RunAs account
    $connectionName = "AzureRunAsConnection" 
    $servicePrincipalConnection = Get-AutomationConnection -Name $connectionName         
    
    Add-AzureRmAccount `
        -ServicePrincipal `
        -TenantId $servicePrincipalConnection.TenantId `
        -ApplicationId $servicePrincipalConnection.ApplicationId `
        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 
}catch {
    if (!$servicePrincipalConnection) {
        $ErrorMessage = "Connection $connectionName not found. Adding new Account ..."
        
        # Add Account
        Start-AzureRmAutomationRunbook `
            -AutomationAccountName $AutomationAccountName `
            -Name $RunbookNameAddAccount `
            -ResourceGroupName $ResourceGroupName
        
    }else {
        Write-Output $_.Exception
        Write-Error -Message $_.Exception
        throw $_.Exception
    }
}

#******************************************************************************
# Azure Analysis Service 
#******************************************************************************
try{
    # Get the server status
    $asServer = Get-AzureRmAnalysisServicesServer -Res $ResourceGroupName `
                                                  -Name $ServerName
    Write-Output "Azure Analysis Services STATUS: $($asServer.State)" | timestamp

    # If not match any day then exit
    if($dayObjects -ne $null) {
        # Can't treat several objects for same time-frame, if there's more than one, pick first
        $matchingObject = $dayObjects | Where-Object {($startTime -ge $_.StartTime) -and ($startTime -lt $_.StopTime)} | Select-Object -First 1

        if($matchingObject -ne $null) {
            # if Paused resume
            if($asServer.State -eq "Paused") {
                Write-Output "Resuming..." | timestamp
                $asServer | Resume-AzureRmAnalysisServicesServer -Verbose
            }      
        }else {
            Write-Output "Pausing services..." | timestamp
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
}catch {
    # Send email
    Start-AzureRmAutomationRunbook `
        -AutomationAccountName $AutomationAccountName `
        -Name $RunbookNameEmail `
        -ResourceGroupName $ResourceGroupName
    
    Write-Output "`n`nFAILED !"
    Write-Output $ResourceGroupName
    Write-Output $ServerName
    Write-Output $serviceTimeZone
    Write-Output $currentDayOfWeek
    Write-Output "$($_.Exception.Message)"
    throw $_.Exception

}finally {
    Write-Output "--- Script finished ---" | timestamp
}
