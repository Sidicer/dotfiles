#!/usr/bin/env bash
# Arch Linux & Sway WM
# +dotfiles
#
# 2023 Deividas Gedgaudas • sidicer.lt

set -o nounset
set -o errtrace
set -o pipefail
IFS=$'\n\t'

echo "Installing dependencies and Yay..."
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay &&  makepkg -si
if [ $? -eq 1 ]; then
  "Installation failed, exiting..."
fi

echo "Installing required packages..."
packages=$(sort pkglist.txt)
nvidia_packages=$(sort pkglist_n.txt)
yay -S --sudoloop --noconfirm --needed $packages
if [ $? -eq 1 ]; then
  "Installation failed, exiting..."
fi

echo "Copying configuration to home directory..."
cp -r .config .gnupg .zshrc $HOME/.
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
fi

echo "Script succeeded."
