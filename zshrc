#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/.liquidprompt/liquidprompt

# Less colors, solarized.
export LESS_TERMCAP_mb=$'\E[5m'           # begin blinking
export LESS_TERMCAP_md=$'\E[0;33m'        # begin bold
#export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold  (light blue)
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[1;30;43m'     # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[4;32m'        # begin underline

source "${HOME}/.fzf.zsh"

alias crontab='CRONTAB=true crontab'
alias myip='dig @resolver1.opendns.com myip.opendns.com +short'
alias s='sudo'
alias v='vim'

if [ $commands[hub] ]; then
  eval "$(hub alias -s)"
fi

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)

  alias k='kubectl'
fi

if [ $commands[helm] ]; then
  source <(helm completion zsh)

  alias h='helm'
fi

if [ $commands[minikube] ]; then
  source <(minikube completion zsh)

  alias m='minikube'
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# vi:et:sw=2 ts=2
