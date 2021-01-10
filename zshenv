unsetopt GLOBAL_RCS

REPORTTIME=10

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export MANPATH="/usr/local/share/man:/usr/share/man"

if [[ "$(uname -s)" == 'Darwin' ]]; then
  export PATH="/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/findutils/libexec/gnuman:/usr/local/opt/grep/libexec/gnuman:/usr/local/opt/coreutils/libexec/gnuman:$PATH"
fi

export PATH="${HOME}/bin:${PATH}"

export EDITOR='vim'
export LANG='pl_PL.UTF-8' LC_CTYPE='pl_PL.UTF-8' LC_MESSAGES='en_US.UTF-8'
export TZ='Europe/Warsaw'

export LESS='-R' LESSHISTFILE='/dev/null'

export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin"
export PATH="${PATH}:${GOBIN}"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# vi:et:sw=2 ts=2
