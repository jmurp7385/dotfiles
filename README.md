# dotfiles
These are my dotfiles and other configs


## Windows 

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; winget install twpayne.chezmoi --accept-package-agreements; $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User"); chezmoi init --apply https://github.com/jmurp7385/dotfiles.git
```

## macOS/fedora

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/jmurp7385/dotfiles.git
```
