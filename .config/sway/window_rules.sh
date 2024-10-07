# WINDOW RULES
  # Virtual machine manager and guest windows to be floating
  for_window [app_id="virt-manager"] floating enable
  for_window [class="KeePassXC"] floating enable

  # Open calendar app on cursor instead of middle of the screen
  for_window [app_id="galendae"] move position cursor, move down 30px

  # Open audio control on cursor
  for_window [app_id="pavucontrol"] floating enable, resize set width 500px height 500px, move position cursor, move down 30px