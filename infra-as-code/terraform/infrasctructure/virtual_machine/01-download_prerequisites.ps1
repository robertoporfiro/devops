Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
Install-Module posh-git -Scope CurrentUser -Force
Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
Install-Module PowerShellGet -Force -SkipPublisherCheck

Import-Module posh-git
Add-PoshGitToProfile -AllHosts
