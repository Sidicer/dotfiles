export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

GPG_TTY=$(tty)
export GPG_TTY
export SSH_AUTH_SOCK=$(gpgconf --list-dirs | grep agent-ssh-socket | cut -d ':' -f 2)

alias vim="nvim"
export EDITOR=nvim

if [[ $TERM = "foot" ]]; then
  alias ssh='TERM=xterm ssh'
fi
