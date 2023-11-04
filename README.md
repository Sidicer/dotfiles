# Arch Linux w/ Sway WM on Nvidia GPU

Here I will be collecting my configuration files (dotfiles) and additional helpers scripts, how-to's related to my Arch/Sway/Nvidia deployment.

## Prerequisites

1. Arch Linux already deployed on your system
2. Sudo user created and logged in with it
3. `pacman -Syu` ran at least once

## Installation

```sh
sudo pacman -S git && git clone https://github.com/Sidicer/dotfiles.git && cd dotfiles
./install.sh
```

## Package list:

```sh
# pkglist.txt:
foot
grim
neofetch
neovim
otf-font-awesome
pinentry-rofi
ranger
rofi-lbonn-wayland-git
slurp
sway
swaybg
swaylock
waybar
wl-clipboard
# pkglist_n.txt:
lib32-nvidia-utils
nvidia
nvidia-settings
nvidia-utils
sway-nvidia
```

## Notes

`nvidia.hook` is required for succesfully updating NVIDIA drivers. If you do not regenerate your initramfs there is going to be an API mismatch after reboot and you won't be able to launch Sway.
