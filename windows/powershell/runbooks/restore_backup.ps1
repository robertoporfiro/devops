<#  
    .SYNOPSIS 
        Backup Azure Analysis Services automated
    
    .PARAMETER server_name  
        The Azure Analysis Service Server endpoint 
    
    .PARAMETER database_name  
        The Analysis Service Database  
            
    .PARAMETER file_name_bkp  
        The name file of backup  
#>  
Param (  
    [parameter(Mandatory=$false)] 
    [string] $server_name = "asazure://brazilsouth.asazure.windows.net/insightsmppostgre",

    [Parameter(Mandatory = $false)]
    [string]$database_name = "MPMS",

    [Parameter(Mandatory = $false)]
    [string]$file_name_bkp = "bkp_analysis_services.abf"
)  

try {
    Write-Output "Logging in to Azure..."
    $userCredential = Get-AutomationPSCredential -Name 'application_user'
    $cred = New-Object -TypeName System.Management.Automation.PSCredential `
                       -ArgumentList $userCredential.UserName,
                                     $userCredential.Password

    Write-Output "Starting restore backup..."  
    Restore-ASDatabase `
        -RestoreFile $file_name_bkp `
        -Server $server_name `
        -Name $database_name `
        -Credential $cred 
} catch {
    Write-Output "`n`nRestore backup failed !"
    Write-Output $server_name
    Write-Output $database_name
    Write-Output $file_name_bkp
    Write-Output $userCredential
    Write-Output $cred
    throw 
} finally {
    Write-Output "--- Script finished ---"
}
