# Arch Linux w/ Sway WM on Nvidia GPU

Here I will be collecting my configuration files (dotfiles) and additional helper scripts or how-to's related to my Arch/Sway/Nvidia deployment.

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
foot # terminal
galendae # calendar
grim # screenshot utility
neofetch # system information
neovim # vim refactored
otf-font-awesome # fonts
pinentry-rofi # pinentry that works with wayland
ranger # terminal based file browser
rofi-lbonn-wayland-git # rofi wayland port
slurp # are selector for screenshots
sway # window manager
swaybg # wallpaper engine for sway
swaylock # lock screen for sway
waybar # status bar for sway
wl-clipboard # wayland clipboard
# pkglist_n.txt:
lib32-nvidia-utils
nvidia
nvidia-settings
nvidia-utils
sway-nvidia
```

## Notes

`nvidia.hook` is required for succesfully updating NVIDIA drivers. If you do not regenerate your initramfs there is going to be an API mismatch after reboot and you won't be able to launch Sway.

## Obligation

[Arch Linux NVIDIA drivers installation guide](https://github.com/korvahannu/arch-nvidia-drivers-installation-guide) by korvahannu

[sway-nvidia](https://github.com/crispyricepc/sway-nvidia) by crispyricepc
