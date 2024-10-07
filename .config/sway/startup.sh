swaymsg -q "workspace 'personal'"
exec $HOME/.config/sway/sway-toolwait.sh --nocheck google-chrome-stable

swaymsg -q "workspace 'code'"
exec $HOME/.config/sway/sway-toolwait.sh --nocheck code

swaymsg -q "workspace 'browse'"
exec $HOME/.config/sway/sway-toolwait.sh --nocheck firefox

swaymsg -q "workspace 'chat'"
exec $HOME/.config/sway/sway-toolwait.sh --nocheck"/usr/bin/slack --enable-features=UseOzonePlatform --enable-features=WebRTCPipeWireCapturer --enable-features=WaylandWindowDecorations --ozone-platform=wayland -s %U"
exec $HOME/.config/sway/sway-toolwait.sh --nocheck "mattermost-desktop %U --ozone-platform=wayland --enable-features=UseOzonePlatform --enable-features=WebRTCPipeWireCapturer"

swaymsg -q "workspace 'terminal'"
exec $HOME/.config/sway/sway-toolwait.sh --nocheck foot