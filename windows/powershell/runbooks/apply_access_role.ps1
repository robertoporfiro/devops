<#  
    .SYNOPSIS 
        Apply access policy roles in Azure Analysis Services
    
    .PARAMETER server_name  
        The Azure Analysis Service Server endpoint 
    
    .PARAMETER database_name  
        The Analysis Service Database  
        
    .PARAMETER container_name  
        The container name with contains json files 
    
    .PARAMETER file_readers  
        The file with roles of read

    .PARAMETER file_admins  
        The file with roles of administrator
#>
param(     
    [parameter(Mandatory=$false)] 
    [string] $server_name = "asazure://brazilsouth.asazure.windows.net/insightsmpms",

    [Parameter(Mandatory = $false)]  
    [String]$database_name = "Insights MPMS",

    [Parameter(Mandatory = $false)]  
    [String]$container_name = "analysis-services",

    [Parameter(Mandatory = $false)]  
    [String]$file_readers = "role_readers.json",

    [Parameter(Mandatory = $false)]  
    [String]$file_admins = "role_admins.json"
)

Write-Output "Applying access policy roles in Azure Analysis Services"

$connection_string = 'DefaultEndpointsProtocol=https;AccountName=mpms;AccountKey=h0du3PT+v2RW4tLWDCac4Q/XBAkHd9LCnJwoDkLJgj8rpz8wyRUaqPniUC6ALS708OpXagjcdtZuv/hYtyWdAQ==;EndpointSuffix=core.windows.net'
$storage_account = New-AzureStorageContext -ConnectionString $connection_string
$inputfile_reader = "C:\Temp\$file_readers"
$inputfile_admin = "C:\Temp\$file_admins"


# Logging in to Azure
Write-Output "Logging in to Azure..."
$userCredential = Get-AutomationPSCredential -Name 'application_user'
$cred = New-Object -TypeName System.Management.Automation.PSCredential `
                   -ArgumentList $userCredential.UserName,
                                 $userCredential.Password

# Download file reader
try {
    Write-Output "Getting file $reader"
    Get-AzureStorageBlobContent -Container $container_name `
                                -Blob $file_readers `
                                -Destination $inputfile_reader `
                                -Context $storage_account `
                                -Force

    # Run Analysis Services Partition Job
    Write-Output "`nApplying Polices: READ"
    Write-Output $inputfile_reader
    Invoke-ASCmd -Server $server_name `
                -InputFile $inputfile_reader `
                -Credential $cred
} catch {
    Write-Output "`n`nFailed: "
    Write-Output $server_name
    Write-Output $database_name
    Write-Output $storage_account
    Write-Output $container_name
    Write-Output $file_readers
    throw 
}

# Download file admins
try {
    Write-Output "Getting file $file_admins"
    Get-AzureStorageBlobContent -Container $container_name `
                                -Blob $file_admins `
                                -Destination $inputfile_admin `
                                -Context $storage_account `
                                -Force

    # Run Analysis Services Partition Job
    Write-Output "`nApplying Polices: Admin"
    Write-Output $inputfile_admin
    Invoke-ASCmd -Server $server_name `
                -InputFile $inputfile_admin `
                -Credential $cred
} catch {
    Write-Output "`n`nFailed: "
    Write-Output $server_name
    Write-Output $database_name
    Write-Output $storage_account
    Write-Output $container_name
    Write-Output $file_admins
    throw 
}

Write-Output "--- Script finished ---"
