# VARIABLES
  # Super: Mod4
  set $mod Mod4

  set $term kitty
  set $menu "rofi -i -modi drun,run,window -show drun"
  set $browser firefox

  # Screenshot: Select rectangle with Slurp, take screenshot with Grim directly to Clipboard with wl-copy
  set $screenshot grim -g "$(slurp -d)" - | wl-copy -t image/png

  # Mod-Keys
  set $key_audiomute XF86AudioMute
  set $key_inputmute XF86AudioMicMute
  set $key_volup XF86AudioRaiseVolume
  set $key_voldown XF86AudioLowerVolume
  set $key_brightnessup XF86MonBrightnessUp
  set $key_brightnesdown XF86MonBrightnessDown

  set $volumetoggle pactl set-sink-mute @DEFAULT_SINK@ toggle
  set $inputmute pactl set-source-mute alsa_input.pci-0000_05_00.6.7.HiFi__hw_acp__source toggle
  set $volumeup pactl set-sink-volume @DEFAULT_SINK@ +5%
  set $volumedown pactl set-sink-volume @DEFAULT_SINK@ -5%

  set $brightnessup light -A 15.0
  set $brightnessdown light -U 15.0

  # Additional
  set $killsway swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'
  set $restartwaybar killall waybar && waybar
  set $swaylock swaylock --clock --effect-blur 5x10 --indicator --timestr "%-H:%M" --datestr "Locked"
