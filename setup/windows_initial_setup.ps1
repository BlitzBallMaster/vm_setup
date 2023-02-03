# Modify ExecutionPolicy
Write-Host ""
Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force

# Install Git
Write-Host "" 
Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git
Add-PoshGitToProfile -AllHosts# Download git

# Pull Main Git Repo
Write-Host ""
mkdir C:\Users\Auron\Documents\git
mkdir C:\Users\Auron\Documents\git\Blitz
cd C:\Users\Auron\Documents\git\Blitz
git init
git pull https://github.com/BlitzBallMaster/vm_setup.git
cd C:\Users\Auron\Documents\git\Blitz\setup

# Add Window Updates to Task Scheduler
Write-Host ""

# Check for Windows Updates
Write-Host ""

