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

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
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
alias myip='curl http://whatismyip.akamai.com/'
alias s='sudo'
alias v='vim'

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

aks_api_server_authorize_ip () {
  az aks update -n "$1" -g "$2" --api-server-authorized-ip-ranges="$( (az aks show -n "$1" -g "$2" -o tsv --query apiServerAccessProfile.authorizedIpRanges --subscription "$3" && echo "$(curl -Ss https://ipv4.icanhazip.com/)/32") | sort | uniq | paste -d ',' -s)" --subscription "$3"
}

aks_api_server_deauthorize_ip () {
  az aks update -n "$1" -g "$2" --api-server-authorized-ip-ranges="$( (az aks show -n "$1" -g "$2" -o tsv --query apiServerAccessProfile.authorizedIpRanges --subscription "$3" | grep -v "$(curl -Ss https://ipv4.icanhazip.com/)/32") | sort | uniq | paste -d ',' -s)" --subscription "$3"
}

git_clone_azure_devops_gfiosvr () {
  git clone "git@ssh.dev.azure.com:v3/GFIOSvr/$1" "$HOME/$1"
}

terragrunt_terraform_cleanup () {
  find . -type d \( -name '.terraform' -o -name '.terragrunt-cache' \) -print -exec rm -rf {} +
}

alias g='git'
alias k='kubectl'
alias h='helm'
alias m='minikube'
alias a='az'
alias t='terraform'
alias tf='terraform'
alias tfd='terraform-docs'
alias tg='terragrunt'
alias cdtemp="cd \"$(mktemp -d)\""
alias wthr='curl wttr.in/Gdańsk'
alias bu='brew update && brew upgrade && brew cleanup'
alias kb='k run -i -t busybox --image=busybox --restart=Never --rm'
alias v='vim'
alias b='brew'
alias vysr="vim -c 'set ft=yaml' -R -"
alias latest="git tag -l '*.*.*' | sort -V | tail -1"

# vi:et:sw=2 ts=2
