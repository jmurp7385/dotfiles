#!/usr/bin/env bash
set -e

echo "=== 1. Installing Chezmoi & System Tools via DNF ==="
sudo dnf install -y chezmoi git zsh vim neovim python3 golang util-linux-user curl wget

echo "=== 2. Enabling RPM Fusion & Updating Fedora ==="
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
                    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update -y

echo "=== 3. Installing DNF CLI Packages ==="
sudo dnf install -y \
    zsh git vim neovim python3 python3-pip golang nodejs \
    util-linux-user curl wget

echo "=== 4. Enabling Flathub & Installing Flatpaks ==="
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Flatpak applications
flatpak install -y flathub \
    org.darktable.Darktable \
    md.obsidian.Obsidian \
    org.videolan.VLC \
    com.spotify.Client \
    org.kde.kdenlive \
    com.brave.Browser

echo "=== 5. Setting Zsh as Default Shell ==="
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
fi

echo "=== 6. Installing NVM & Node LTS ==="
export NVM_DIR="$HOME/.nvm"

if [ ! -d "$NVM_DIR" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

# Load NVM into active installer subshell
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node LTS & enable Corepack
nvm install --lts
nvm use --lts
corepack enable