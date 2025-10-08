export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell-fp"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export MOZ_ENABLE_WAYLAND=1
export ELECTRON_OZONE_PLATFORM_HINT=auto
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORMTHEME=qt6ct
GPG_TTY=$(tty)
export GPG_TTY

export SSH_AUTH_SOCK=$(gpgconf --list-dirs | grep agent-ssh-socket | cut -d ':' -f 2)

alias vim="nvim"
export EDITOR=nvim
alias neofetch="fastfetch"

if [[ $TERM = "xterm-kitty" ]]; then
  alias ssh='TERM="xterm-256color" ssh'
fi
