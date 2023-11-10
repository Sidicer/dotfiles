#!/usr/bin/env bash

# Arch w/ Sway on NVIDIA
# packages & dotfiles
# 2023 Deividas Gedgaudas • sidicer.lt

set -o nounset
set -o errtrace
set -o pipefail
IFS=$'\n\t'
PATH=/usr/local/bin:$PATH

_SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Installing dependencies and Yay..."
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay &&  makepkg -si
if [ $? -eq 1 ]; then
  "Installation failed, exiting..."
fi

echo "Installing required packages..."
packages=$(sort $_SCRIPT_DIR/pkglist.txt)
audio_packages=$(sort $_SCRIPT_DIR/pkglist_a.txt)
nvidia_packages=$(sort $_SCRIPT_DIR/pkglist_n.txt)
yay -S --sudoloop --noconfirm --needed $packages $audio_packages
if [ $? -eq 1 ]; then
  "Installation failed, exiting..."
fi

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copying configuration to home directory..."
cp -r $_SCRIPT_DIR/.config $_SCRIPT_DIR/.gnupg $_SCRIPT_DIR/.zshrc $HOME/.
if [ $? -eq 1 ]; then
  "Copy failed, exiting..."
fi

echo "Checking if NVIDIA GPU is installed in the system..."
gpu=$(/usr/bin/lspci | grep -i '.* vga .* nvidia .*')
if [[ $gpu ]]; then
  echo "NVIDIA GPU found! Installing additional packages..."
  yay -S --sudoloop --noconfirm --needed $nvidia_packages
  sudo sed -i "s/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/" /etc/mkinitcpio.conf
  sudo mkinitcpio -P
  echo "!!! Add \"nvidia-drm.modeset=1\" to kernel launch parameters (GRUB_CMDLINE_LINUX) manually !!!"
  sudo mkdir -p /etc/pacman.d/hooks && sudo cp $_SCRIPT_DIR/nvidia.hook /etc/pacman.d/hooks/nvidia.hook
  <<EOF>> $HOME/.zprofile cat
  if [[ -z \$DISPLAY && \$TTY = /dev/tty1 ]]; then
    exec sway-nvidia
  fi
EOF
else
  <<EOF>> $HOME/.zprofile cat
  if [[ -z \$DISPLAY && \$TTY = /dev/tty1 ]]; then
    exec sway
  fi
EOF
fi

echo "Script succeeded."
