Set-ExecutionPolicy -Scope CurrentUser -Y
RemoteSigned
Get-ExecutionPolicy -List

$script = New-Object Net.WebClient
$script | Get-Member
$script.DownloadString("https://chocolatey.org/install.ps1")
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco upgrade chocolatey

choco install python3 --force -Y
choco upgrade

choco install ojdkbuild8 -Y
choco upgrade

choco install jre8 -Y
choco upgrade

choco install winrar -Y
choco upgrade

choco install dotnetfx -Y
choco upgrade

choco install visualstudiocommunity2017 -Y
choco upgrade

choco install vscode -Y
choco upgrade

choco install sql-server-management-studio -Y
choco upgrade

choco install ssdt17 -Y
choco upgrade

choco install powerbi -Y
choco upgrade

choco install azure-cli
choco upgrade

choco install microsoft-monitoring-agent
choco upgrade

choco install autoruns
choco upgrade

choco install terraform
choco upgrade

choco install curl
choco upgrade

choco install git
choco upgrade
