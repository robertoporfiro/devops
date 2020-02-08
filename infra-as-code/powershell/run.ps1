param(
    [parameter(Mandatory=$false)]
    [String] $PROJECT_NAME = "<PRODUCT_NAME>-<CLIENT_NAME>",

    [parameter(Mandatory=$true)]
    [ValidateSet("oracle", "postgresql")]
    [String] $DATA_SOURCE = "<DATA_SOURCE>"
)

#******************************************************************************
# Logs
#******************************************************************************
Write-Output "Script started with UTC zone." | timestamp
$ErrorActionPreference = "Continue"
filter timestamp {"[$(Get-Date -Format G)]: $_"}

#******************************************************************************
# Modules and policy
#******************************************************************************
# Check if module PowerShellGet is installed
If (Get-Module -ListAvailable -Name PowerShellGet) {
    Write-Output "Module: PowerShellGet exists" | timestamp

} Else {
    # Install PowerShellGet
    Install-Module PowerShellGet -Force -AllowClobber -SkipPublisherCheck | timestamp # -Force -AllowClobber to auto confirm
}

# Check if module posh-git is installed
If (Get-Module -ListAvailable -Name posh-git) {
    Write-Output "Module: posh-git exists" | timestamp

} Else {
    # Install git
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
    Install-Module posh-git -Scope CurrentUser -Force -AllowClobber # -Force -AllowClobber to auto confirm
    Import-Module posh-git
    'Import-Module Posh-Git' | Out-File -Append -Encoding default -FilePath $profile
    Add-PoshGitToProfile -AllHosts
}

# Check if choco is installed
If (Test-Path -Path "$env:ProgramData\Chocolatey") {
    Write-Output "Chocolatey already Installed" | timestamp

} Else {
    Write-Output "Chocolatey is not Installed. Installing ..." | timestamp
    # Install chocolatey
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

    # .NET and git need reboot
    choco upgrade chocolatey | timestamp
    choco install git.install --force --yes --ignore-checksums --no-progress | timestamp
    choco install dotnetfx --force --yes --ignore-checksums --no-progress | timestamp
    Restart-Computer -Force -Wait| timestamp
}

Write-Output "Modules and policy FINISHED"| timestamp

#******************************************************************************
# Download and install application
#******************************************************************************
Write-Output "Chocolatey install application ..." | timestamp

# Install application - choco
Powershell .\choco_install_app.ps1 | timestamp

# Download data_gateway
Write-Output "Downloading Data Gateway"| timestamp
$url = "https://requirements.blob.core.windows.net/applications/data_gateway.exe"
$file_output = "tmp\data_gateway.exe"

Start-BitsTransfer `
    -Source $url `
    -Destination $file_output `
    -RetryTimeout 600 | timestamp

Write-Output "Opening Data Gateway"| timestamp
Start-Process .\tmp\data_gateway.exe -Wait

# Install SSDT
Write-Output "Downloading SSDT"| timestamp
$url = "https://go.microsoft.com/fwlink/?linkid=2095463" # https://requirements.blob.core.windows.net/applications/SSDT.exe
$file_output = "tmp\SSDT.exe"

Start-BitsTransfer `
    -Source $url `
    -Destination $file_output `
    -RetryTimeout 600 | timestamp

Write-Output "Installing SSDT"| timestamp
.\tmp\SSDT.exe /INSTALLAS /passive | timestamp

# Install drivers, check if PostgreSQL or Oracle
If ($DATA_SOURCE -eq "oracle") {
    Write-Output "Environment: ORACLE" | timestamp

    Write-Output "Downloading drivers - ORACLE" | timestamp
    $url = "https://requirements.blob.core.windows.net/drivers/ODAC122011_x64.zip"
    $file_output = "tmp\ODAC122011_x64.zip"

    Start-BitsTransfer `
        -Source $url `
        -Destination $file_output `
        -RetryTimeout 600 | timestamp

    Expand-Archive `
        -LiteralPath  .\tmp\ODAC122011_x64.zip `
        -DestinationPath .\tmp\drivers_oracle\ `
        -Force | timestamp

    Write-Output "Opening drivers - ORACLE" | timestamp
    Start-Process tmp\drivers_oracle\setup.exe -Wait

} Else {
    Write-Output "Environment: POSTGRESQL" | timestamp
    choco install dbeaver --force --yes --ignore-checksums --no-progress | timestamp

    Write-Output "Downloading drivers - POSTGRESQL" | timestamp
    $url = "https://requirements.blob.core.windows.net/drivers/psqlodbc.exe"
    $file_output = "tmp\psqlodbc.exe"

    Start-BitsTransfer `
        -Source $url `
        -Destination $file_output `
        -RetryTimeout 600 | timestamp

    .\tmp\psqlodbc.exe /install /passive
}

# Download and install data_integration
Write-Output "Downloading Data Integration"| timestamp
$url = "https://sourceforge.net/projects/pentaho/files/Pentaho%208.3/client-tools/pdi-ce-8.3.0.0-371.zip/download"
$file_output = "tmp\data_integration_8.3.zip"

Start-BitsTransfer `
    -Source $url `
    -Destination $file_output `
    -RetryTimeout 720 | timestamp

Expand-Archive `
    -LiteralPath  tmp\data_integration_8.3.zip `
    -DestinationPath C:\Users\$env:username\$PROJECT_NAME\etl `
    -Force | timestamp

Write-Output "Installing Data Integration"| timestamp
.\C:\Users\$env:username\$PROJECT_NAME\etl\data-integration\set-pentaho-env.bat | timestamp

Write-Output "Executing tests"| timestamp
.\C:\Users\$env:username\$PROJECT_NAME\etl\data-integration\runSamples.bat | timestamp

# Create bat to delete file's log
$PATH_LOG = "C:\Users\$env:username\$PROJECT_NAME\etl\logs"
Set-Content `
    -Path C:\Users\$env:username\$PROJECT_NAME\etl\delete_log.bat `
    -Value "forfiles -p $PATH_LOG -d -60 -m *.log -c 'cmd /c del /f /q @path'" `
    -Encoding ASCII

# Remove unecessary files
rm -r tmp\*

Write-Output "Download and install application FINISHED. Rebooting in 10 min..."| timestamp
#******************************************************************************
# Reboot
#******************************************************************************
Start-Sleep -s 600
Restart-Computer -Force
