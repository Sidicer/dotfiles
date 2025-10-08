#!/usr/bin/env bash

set -o nounset
set -o errtrace
set -o pipefail
IFS=$'\n\t'
PATH=/usr/local/bin:$PATH

_SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Installing dependencies..."
sudo pacman -S --needed git base-devel curl
if [ $? -eq 1 ]; then
  echo "Installation failed, exiting..."
fi

echo "Installing yay..."
if ! command -v yay > /dev/null 2>&1; then
  git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
  if [ $? -eq 1 ]; then
    echo "YAY installation failed, exiting..."
  fi
else
  echo "Yay located. Skipping installation..."
fi

echo "Installing required packages..."
packages=$(sort "$_SCRIPT_DIR/pkglist.txt")
audio_packages=$(sort "$_SCRIPT_DIR/pkglist_a.txt")
yay -S --sudoloop --noconfirm --needed "$packages" "$audio_packages"
if [ $? -eq 1 ]; then
  echo "Installation failed, exiting..."
fi

echo "Installing oh-my-zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "ohmyzsh already installed, skipping..."
fi

echo "Installing nvChad"
if [ -d "$HOME/.config/nvim" ]; then
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak-$(date '+%Y-%m-%d')"
fi
git clone https://github.com/NvChad/starter ~/.config/nvim

echo "Copying configuration to home directory..."
cp -r "$_SCRIPT_DIR/.config" "$_SCRIPT_DIR/.gnupg" "$_SCRIPT_DIR/.zshrc" "$HOME/."
if [ $? -eq 1 ]; then
  echo "Copy failed, exiting..."
fi

<<EOF>> "$HOME/.zprofile" cat
if [[ -z \$DISPLAY && \$TTY = /dev/tty1 ]]; then
  exec sway
fi
EOF

echo "Script succeeded."
