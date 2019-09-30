<#   
.DESCRIPTION  
    Resume/stop an Azure Power BI Embedded Capacity according to a schedule using Azure Automation.    
.PARAMETER resourceGroupName
    Name of the resource group to which the capacity is assigned.
.PARAMETER azureRunAsConnectionName
    Azure Automation Run As account name. Needs to be able to access
    the $capacityName.
.PARAMETER serverName  
    Azure Power BI Embedded Capacity name. 
.EXAMPLE     
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
filter timestamp {"[$(Get-Date -Format G)]: $_"}

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


#Authenticate with Azure Automation Run As account (service principal)
$runAsConnectionProfile = Get-AutomationConnection -Name $azureRunAsConnectionName
Add-AzureRmAccount -ServicePrincipal -TenantId $runAsConnectionProfile.TenantId `
                   -ApplicationId $runAsConnectionProfile.ApplicationId`
                   -CertificateThumbprint $runAsConnectionProfile.CertificateThumbprint | Out-Null
Write-Output "Authenticated with Automation Run As Account." | timestamp

# Get the PBI Capacity object
$pbiEmbCap = Get-AzureRmPowerBIEmbeddedCapacity -ResourceGroupName $resourceGroupName -Name $capacityName
Write-Output "PBI Capacity name found: $($pbiEmbCap.Name)" | timestamp
Write-Output "Current PBI Capacity status: $($pbiEmbCap.State), pricing tier: $($pbiEmbCap.Sku)" | timestamp

 if($pbiEmbCap.State -eq "Paused") {
    Write-Output "PBI Capacity was paused. Resuming!" | timestamp
    $pbiEmbCap = Resume-AzureRmPowerBIEmbeddedCapacity -Name $pbiEmbCap.Name -ResourceGroupName $resourceGroupName
    Write-Output "PBI Capacity resumed." | timestamp
    $pbiEmbCap = Get-AzureRmPowerBIEmbeddedCapacity -ResourceGroupName $resourceGroupName -Name $capacityName
    Write-Output "Current PBI Capacity state: $($pbiEmbCap.State), pricing tier: $($pbiEmbCap.Sku)" | timestamp
} else{
    Write-Output "PBI Capacity already started!" | timestamp            
}

Write-Output "Script finished." | timestamp
