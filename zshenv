unsetopt GLOBAL_RCS

REPORTTIME=10

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export MANPATH="/usr/local/share/man:/usr/share/man"

if [[ "$(uname -s)" == 'Darwin' ]]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

export PATH="$HOME/bin:$PATH"

export EDITOR='vim'
export LANG='pl_PL.UTF-8'
export LC_CTYPE='pl_PL.UTF-8'
export LC_MESSAGES='en_US.UTF-8'
export TZ='Europe/Warsaw'

export LESS='-R'
export LESSHISTFILE='/dev/null'

export PROJECT_HOME=$HOME/GitHub
