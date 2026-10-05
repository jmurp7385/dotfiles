Set-ExecutionPolicy Bypass -Scope Process -Force;
winget install twpayne.chezmoi --accept-package-agreements;
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User");
chezmoi init --apply https://github.com/jmurp7385/dotfiles.git