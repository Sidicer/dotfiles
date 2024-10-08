# DISPLAYS
  # Wallpaper
  
  # Uncomment with a path to your wallpaper.
  # output * bg ~/Pictures/wallpaper.jpg fill

  output DP-7 position 0,0 mode 1920x1080@60.000Hz
  #output DP-9 position 0,0 mode 1920x1080@60.000Hz
  output DP-9 position 0,0 mode 1720x1440@120.000Hz
  output DP-6 position 1920,-150 transform 90 mode 1920x1080@60.000Hz
  output DP-8 position 1920,-150 transform 90 mode 1920x1080@60.000Hz
  output HDMI-A-1 position 0,0 mode 1720x1440@59.936Hz
  output eDP-1 position 0,1080

  workspace "personal" output eDP-1
  workspace "code" output DP-7
  workspace "browse" output DP-7
  workspace "chat" output DP-6
  #workspace "terminal" output DP-6
