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
fi

if [ $commands[helm] ]; then
  source <(helm completion zsh)
fi

if [ $commands[minikube] ]; then
  source <(minikube completion zsh)
fi

if [ $commands[gcloud] ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

if [ $commands[pyenv] ]; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if [ $commands[az] ]; then
  source '/usr/local/etc/bash_completion.d/az'
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
LP_PS1_PREFIX='$(kube_ps1) '

if [ $commands[stern] ]; then
  eval "$(stern --completion zsh)"
fi

if [ $commands[argocd] ]; then
  source <(argocd completion zsh)
fi

if [ $commands[kind] ]; then
  source <(kind completion zsh)
fi

docker_download () {
  if (( $# == 0 ))
  then echo "docker_download" requires exactly 1 argument.; return; fi
  docker pull "$1"
  output="$(echo "$1" | sed 's#.*/.*/\([a-zA-Z0-9][a-zA-Z0-9_.-]\{0,30\}\):\([[:alnum:]_][[:alnum:]_.-]\{0,127\}\)#\1-\2#').tar"
  docker save -o "$output" "$1"
  gzip -f "$output"
}

alias g='git'
alias k='kubectl'
alias h='helm'
alias m='minikube'
alias a='az'
alias t='terraform'
alias tf='terraform'
alias tg='terragrunt'
alias cdtemp="cd \"$(mktemp -d)\""
alias wthr='curl wttr.in/Gdańsk'

# vi:et:sw=2 ts=2
