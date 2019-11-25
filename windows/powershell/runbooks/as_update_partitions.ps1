param(
    [parameter(Mandatory=$false)] 
    [string] $ResourceGroupName = "INSIGHTS_MP_PROD", 

    [parameter(Mandatory=$false)] 
    [string] $EndpointServer = "asazure://brazilsouth.asazure.windows.net/insightsmpms",

    [parameter(Mandatory=$false)] 
    [string] $ServerName = "insightsmpms",

    [Parameter(Mandatory=$false)]  
    [String]$ContainerName = "analysis-services",

    [Parameter(Mandatory=$false)]  
    [String]$NameUser = "application_user",

    [parameter(Mandatory=$false)]
    [string] $AutomationAccountName = "sajinsights-mpms",

    [parameter(Mandatory=$false)]
    [string] $RunbookNameEmail = "send_email",

    [Parameter(Mandatory=$false)]  
    [String]$FilePartitions = "update_mpms.json"
)

# Log
filter timestamp {"[$(Get-Date -Format G)]: $_"}
Write-Output "Script started with UTC zone." | timestamp

Write-Output "PARAMETERS: `
                                ResourceGroupName: $ResourceGroupName `
                                EndpointServer: $EndpointServer `
                                ServerName: $ServerName `
                                ContainerName: $ContainerName `
                                FilePartitions: $FilePartitions `
                                NameUser: $NameUser `
                                AutomationAccountName: $AutomationAccountName `
                                RunbookNameEmail: $RunbookNameEmail" | timestamp

# Set action if error
$ErrorActionPreference = "Stop"

#******************************************************************************
# Prepare File
#******************************************************************************
$connection_string = 'DefaultEndpointsProtocol=https;AccountName=mpms;AccountKey=h0du3PT+v2RW4tLWDCac4Q/XBAkHd9LCnJwoDkLJgj8rpz8wyRUaqPniUC6ALS708OpXagjcdtZuv/hYtyWdAQ==;EndpointSuffix=core.windows.net'
$storage_account = New-AzureStorageContext -ConnectionString $connection_string
$inputfile = "C:\Temp\$FilePartitions"

#******************************************************************************
# Logging into Azure
#******************************************************************************
Write-Output "Logging in to Azure..." | timestamp

try {
    $userCredential = Get-AutomationPSCredential -Name $NameUser
    $cred = New-Object -TypeName System.Management.Automation.PSCredential `
                       -ArgumentList $userCredential.UserName,
                                     $userCredential.Password
} catch {
    Write-Output $_.Exception
    Write-Error -Message $_.Exception
    throw $_.Exception
}

#******************************************************************************
# Azure Analysis Service 
#******************************************************************************
try {        
    # Get the server status
    $asServer = Get-AzureRmAnalysisServicesServer -Res $ResourceGroupName `
                                                  -Name $ServerName
    Write-Output "Azure Analysis Services STATUS: $($asServer.State)" | timestamp

    # Download file
    if($asServer.State -eq "Succeeded") {
        Write-Output "Getting file $file_admins" | timestamp
        Get-AzureStorageBlobContent `
            -Container $ContainerName `
            -Blob $FilePartitions `
            -Destination $inputfile `
            -Context $storage_account `
            -Force
                
        # Update
        Write-Output "`n"
        Write-Output "Running file: $FilePartitions" | timestamp
        Invoke-ASCmd `
            -Server $EndpointServer `
            -InputFile $inputfile `
            -Credential $cred
    }else {
        Write-Warning "Services paused. Exiting" 
    } 
    
}catch {
    # Send email
    Start-AzureRmAutomationRunbook `
        -AutomationAccountName $AutomationAccountName `
        -Name $RunbookNameEmail `
        -ResourceGroupName $ResourceGroupName
    
    Write-Output "`n`nFAILED !" | timestamp
    Write-Output $ResourceGroupName
    Write-Output $ServerName
    Write-Output "$($_.Exception.Message)"
    throw $_.Exception

}finally {
    Write-Output "`n"
    Write-Output "--- Script finished ---" | timestamp
}
