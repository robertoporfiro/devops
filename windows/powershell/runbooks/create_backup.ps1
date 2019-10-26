<#  
    .SYNOPSIS 
        Backup Azure Analysis Services automated
    
    .PARAMETER serverName  
        The Azure Analysis Service Server endpoint 
    
    .PARAMETER databaseName  
        The Analysis Service Database  
#>  
Param (  
    [parameter(Mandatory=$false)] 
    [string] $serverName = "asazure://brazilsouth.asazure.windows.net/insightsmpms",

    [Parameter(Mandatory = $false)]  
    [String]$databaseName = "Insights MPMS"
)  


try {
    Write-Output "Logging in to Azure..."
    $userCredential = Get-AutomationPSCredential -Name 'application_user'
    $cred = New-Object -TypeName System.Management.Automation.PSCredential `
                       -ArgumentList $userCredential.UserName,
                                     $userCredential.Password

    Write-Output "Starting Backup..."  
    Backup-ASDatabase `
        -BackupFile ("bkp_analysis_services.abf") `
        -Server $serverName `
        -Name $databaseName `
        -Credential $cred `
        -AllowOverwrite

} catch {
    Write-Output "`n`nBackup failed !"
    Write-Output $serverName
    Write-Output $databaseName
    Write-Output $userCredential
    Write-Output $cred
    throw 

} finally {
    Write-Output "--- Script finished ---"
}
