param(     
    [parameter(Mandatory=$false)] 
    [string] $Username = "bruno.moura@softplan.com.br",

    [parameter(Mandatory=$false)] 
    [string] $EmailTo = "bruno.moura@softplan.com.br",
    
    [parameter(Mandatory=$false)] 
    [string] $EmailFrom = "bruno.moura@softplan.com.br",

    [parameter(Mandatory=$false)] 
    [string] $Password = "&&&&&&&&&&&&&&&&",

    [parameter(Mandatory=$false)] 
    [string] $SmtpServer = 'smtp.office365.com',
    
    [parameter(Mandatory=$false)] 
    [string] $Subject = "Runbook FAILED!",
    
    [parameter(Mandatory=$false)] 
    [string] $Body = "The runbook failed"
)

$PasswordConverted= ConvertTo-SecureString $Password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential $Username, $PasswordConverted

Send-MailMessage `
    -From $EmailFrom `
    -To $EmailTo `
    -Subject $Subject `
    -Body $Body `
    -SmtpServer $SmtpServer `
    -Credential $Credential `
    -Usessl

Write-Output "Email sent succesfully" 
