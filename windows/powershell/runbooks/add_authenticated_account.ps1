param(
    [Parameter(Mandatory=$false)]  
    [String]$NameUser = "application_user"
)

#******************************************************************************
# Add an authenticated account
#******************************************************************************
Write-Output "Adding account..."

try {
    # Add an authenticated account to use for Azure Resource Manager
    $connectionName = "AzureRunAsConnection" 
    $servicePrincipalConnection = Get-AutomationConnection -Name $connectionName         
    
    Add-AzureRmAccount `
        -ServicePrincipal `
        -TenantId $servicePrincipalConnection.TenantId `
        -ApplicationId $servicePrincipalConnection.ApplicationId `
        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 

    # Show accounts
    Get-AutomationPSCredential -Name $NameUser
    Write-Output "------------------------------------------------------------`n"
}catch {

    if (!$servicePrincipalConnection) {
        $ErrorMessage = "Connection $connectionName not found."
        throw $ErrorMessage
    } else {
        Write-Output $_.Exception
        Write-Error -Message $_.Exception
        throw $_.Exception
    }
}
