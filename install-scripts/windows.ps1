# Run as Administrator
$ErrorActionPreference = "Stop"

Write-Host "--- 1 Windows Tweaks ---" -ForegroundColor Cyan
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0

Write-Host "--- 2 Installing Chezmoi via Winget ---" -ForegroundColor Cyan
if (-not (Get-Command chezmoi -ErrorAction SilentlyContinue)) {
    winget install --id twpayne.chezmoi --silent --accept-package-agreements --accept-source-agreements
    
    # Refresh PATH in active session so 'chezmoi' is immediately available
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

Write-Host "--- 3 Installing Core Apps via Winget ---" -ForegroundColor Cyan
$packages = @(
    "Adobe.CreativeCloud",
    "AntibodySoftware.WizTree",
    "ArashiVisionInc.Insta360Studio",
    "Brave.Brave",
    "Corsair.iCUE.5",
    "Darktable.Darktable",
    "Git.Git",
    "GoLang.Go",
    "Greenshot.Greenshot",
    "Hellzerg.Optimizer",
    "KDE.Kdenlive",
    "Microsoft.PowerToys",
    "Neovim.Neovim",
    "NVIDIA.GeForceExperience",
    "Obsidian.Obsidian",
    "Python.Python.3.12",
    "Spotify.Spotify",
    "Synology.DriveClient",
    "Synology.SynologyDriveAssistant",
    "twpayne.chezmoi",
    "VideoLAN.VLC",
    "Vim.Vim"
)

foreach ($pkg in $packages) {
    winget install --id $pkg --silent --accept-package-agreements --accept-source-agreements
}


Write-Host "--- 4 PowerShell Modules (Posh-Git) ---" -ForegroundColor Cyan
Install-Module -Name posh-git -Scope CurrentUser -Force -AllowClobber
Install-Module -Name PSReadLine -Scope CurrentUser -Force -AllowClobber

Write-Host "--- 5 Installing NVM for Windows via Winget ---" -ForegroundColor Cyan
winget install --id CoreyButler.NVMforWindows --silent --accept-package-agreements --accept-source-agreements

# Refresh PATH in active session so 'nvm' command is immediately available
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install Node LTS and enable Corepack
if (Get-Command nvm -ErrorAction SilentlyContinue) {
    Write-Host "Installing Node LTS via NVM..." -ForegroundColor Yellow
    nvm install lts
    nvm use lts
    
    Write-Host "Enabling Corepack..." -ForegroundColor Yellow
    corepack enable
}