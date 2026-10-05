Bash
#!/usr/bin/env bash
set -e

echo "=== 1. Installing Homebrew if missing ==="
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "=== 2. Installing Chezmoi & Dev Tools ==="
brew install chezmoi git zsh vim neovim python3 go nvm

echo "=== 3 Installing GUI Applications (Casks) ==="
brew install --cask \
    adobe-creative-cloud \
    darktable \
    obsidian \
    insta360-studio \
    kdenlive \
    synology-drive \
    magnet \
    brave-browser

echo "Note: Adobe Lightroom and Photoshop can now be installed via Creative Cloud desktop app."

echo "=== 4 Installing NVM via Homebrew ==="
brew install nvm

mkdir -p ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# Install Node LTS & enable Corepack
nvm install --lts
nvm use --lts
corepack enable