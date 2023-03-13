# Modify ExecutionPolicy
Write-Host ""
Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force

# Install Git
Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git
Add-PoshGitToProfile -AllHosts

# Clone ThreatPursuit Git Repo
cd C:\Users\Auron\Documents\git\
git init
git pull https://github.com/mandiant/ThreatPursuit-VM.git

# Add Window Updates to Task Scheduler


# Run install script
./install.ps1
