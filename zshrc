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

source /usr/local/bin/virtualenvwrapper.sh

alias crontab='CRONTAB=true crontab'
alias myip='dig @resolver1.opendns.com myip.opendns.com +short'

# vi:et:sw=2 ts=2
