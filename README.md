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

## First-run bootstrap notes

- Chezmoi runs one-time bootstrap scripts from [`home/`](./home/) using `run_once_*` naming.
- Monaspace Nerd Font is installed automatically for Windows, macOS, and Linux via:
  - [`home/run_onchange_install-monaspace-nerd-font.ps1.tmpl`](./home/run_onchange_install-monaspace-nerd-font.ps1.tmpl)
  - [`home/run_onchange_install-monaspace-nerd-font.sh.tmpl`](./home/run_onchange_install-monaspace-nerd-font.sh.tmpl)
- If Monaspace Nerd Font is unavailable, bootstrap falls back to **FiraCode Nerd Font**.
- Terminal defaults are configured to use **Monaspace Krypton NF 12**, falling back to **FiraCode Nerd Font Mono 12**, via:
  - [`home/run_onchange_zz_configure-terminal-font.ps1.tmpl`](./home/run_onchange_zz_configure-terminal-font.ps1.tmpl) (Windows Terminal)
  - [`home/run_onchange_zz_configure-terminal-font.sh.tmpl`](./home/run_onchange_zz_configure-terminal-font.sh.tmpl) (Terminal.app on macOS, GNOME Terminal on Fedora)
  - [`home/run_onchange_zz_configure-vscode-terminal-font.ps1.tmpl`](./home/run_onchange_zz_configure-vscode-terminal-font.ps1.tmpl) (VS Code on Windows)

## Zsh layout

- [`home/dot_zshrc.tmpl`](./home/dot_zshrc.tmpl) is the main loader and prompt selector.
- [`home/dot_tooling.zsh.tmpl`](./home/dot_tooling.zsh.tmpl) contains shared SDK/tooling `PATH`, aliases, and Node/NVM initialization.
- [`home/dot_work.zsh.tmpl`](./home/dot_work.zsh.tmpl) is for work/private enterprise environment settings.

Prompt selection is controlled with `DOTFILES_PROMPT_THEME`:

- `p10k` (default): uses `powerlevel10k/powerlevel10k` and loads `~/.p10k.zsh` when present.
- `starship`: skips p10k and initializes Starship when available.
