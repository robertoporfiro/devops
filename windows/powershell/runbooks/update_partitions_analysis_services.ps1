$connection_string = 'DefaultEndpointsProtocol=https;`
                      AccountName=<name_container>;`
                      AccountKey=<your_account_key>;`
                      EndpointSuffix=core.windows.net'
$storage_account = New-AzureStorageContext -ConnectionString $connection_string
$container_name = '<name>' 
$blob = "<name_file>.json"
$inputfile = "C:\Temp\$blob"

# Automation Credentials with Analysis Services permissions
$userCredential = Get-AutomationPSCredential -Name '<name_user>'
$cred = New-Object -TypeName System.Management.Automation.PSCredential `
                   -ArgumentList $userCredential.UserName,`
                                 $userCredential.Password

# Download inputfile with Analysis Services metadata
Get-AzureStorageBlobContent -Container 'container_name' `
                            -Blob $blob`
                            -Destination $inputfile`
                            -Context $storage_account `
                            -Force

# Run Analysis Services Partition Job
Invoke-ASCmd -Server "asazure://brazilsouth.asazure.windows.net/<name_analysis_services>" `
             -InputFile $inputfile`
             -Credential $cred
