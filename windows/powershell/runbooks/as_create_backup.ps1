<#  
    .SYNOPSIS 
        Backup Azure Analysis Services automated
    
    .PARAMETER serverName  
        The Azure Analysis Service Server endpoint 
    
    .PARAMETER databaseName  
        The Analysis Service Database  

    .PARAMETER name_user  
        name_user  
    
    .PARAMETER BkpFileName  
        The BkpFileName 
#>  
Param (  
    [parameter(Mandatory=$false)] 
    [string] $ServerName = "asazure://brazilsouth.asazure.windows.net/insightsmpms",

    [Parameter(Mandatory = $false)]  
    [String]$DatabaseName = "Insights MPMS",

    [Parameter(Mandatory = $false)]  
    [String]$NameUser = "application_user",

    [Parameter(Mandatory = $false)]  
    [String]$BkpFileName = "bkp_analysis_services.abf",
    
    [parameter(Mandatory=$false)]
    [string] $AutomationAccountName = "sajinsights-mpms",

    [parameter(Mandatory=$false)]
    [string] $RunbookNameEmail = "send_email",

    [parameter(Mandatory=$false)] 
    [string] $ResourceGroupName = "INSIGHTS_MP_PROD" 
) 

# Log
filter timestamp {"[$(Get-Date -Format G)]: $_"}
Write-Output "Script started with UTC zone." | timestamp

Write-Output "PARAMETERS: `
                                    ServerName: $ServerName `
                                    DatabaseName: $DatabaseName `
                                    BkpFileName: $BkpFileName `
                                    NameUser: $NameUser" | timestamp

# Set action if error
$ErrorActionPreference = "Stop"

#******************************************************************************
# Logging into Azure
#******************************************************************************
Write-Output "Logging in to Azure..." | timestamp

try {
    $userCredential = Get-AutomationPSCredential -Name $NameUser
    $cred = New-Object -TypeName System.Management.Automation.PSCredential `
                       -ArgumentList $userCredential.UserName,
                                     $userCredential.Password
}catch {
    Write-Output $_.Exception
    Write-Error -Message $_.Exception
    throw $_.Exception
}

#******************************************************************************
# Azure Analysis Service 
#******************************************************************************
try {
    Write-Output "Starting Backup..." | timestamp
    Backup-ASDatabase `
        -BackupFile $BkpFileName `
        -Name $DatabaseName `
        -Credential $cred `
        -AllowOverwrite

}catch {
    # Send email
    Start-AzureRmAutomationRunbook `
        -AutomationAccountName $AutomationAccountName `
        -Name $RunbookNameEmail `
        -ResourceGroupName $ResourceGroupName
    
    Write-Output "Backup FAILED !`n" | timestamp
    Write-Output $userCredential
    Write-Output $cred
    Write-Output "$($_.Exception.Message)"
    throw $_.Exception 

}finally {
    Write-Output "--- Script finished ---" | timestamp
}
