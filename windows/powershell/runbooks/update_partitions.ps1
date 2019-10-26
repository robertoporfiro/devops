param(     
    [parameter(Mandatory=$false)] 
    [string] $server_name = "asazure://brazilsouth.asazure.windows.net/insightsmpms",

    [Parameter(Mandatory = $false)]  
    [String]$database_name = "Insights MPMS",

    [Parameter(Mandatory = $false)]  
    [String]$container_name = "analysis-services",

    [Parameter(Mandatory = $false)]  
    [String]$file_partitions = "inputfile_mpms.json"
)

Write-Output "Starting update into Analysis Services..."

$connection_string = 'DefaultEndpointsProtocol=https;AccountName=mpms;AccountKey=h0du3PT+v2RW4tLWDCac4Q/XBAkHd9LCnJwoDkLJgj8rpz8wyRUaqPniUC6ALS708OpXagjcdtZuv/hYtyWdAQ==;EndpointSuffix=core.windows.net'
$storage_account = New-AzureStorageContext -ConnectionString $connection_string
$inputfile = "C:\Temp\$file_partitions"

# Automation Credentials with Analysis Services permissions
try {
    Write-Output "Logging in to Azure..."
    $userCredential = Get-AutomationPSCredential -Name 'application_user'
    $cred = New-Object -TypeName System.Management.Automation.PSCredential `
                    -ArgumentList $userCredential.UserName,
                                    $userCredential.Password

    Write-Output "Getting file $file_admins"
    Get-AzureStorageBlobContent -Container $container_name `
                                -Blob $file_partitions `
                                -Destination $inputfile `
                                -Context $storage_account `
                                -Force

    # Run Analysis Services Partition Job
    Write-Output "`nRunning file: $file_partitions"
    Invoke-ASCmd -Server $server_name `
                -InputFile $inputfile `
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
