# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' 
}

export PS1="\u[\W]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export GOPATH=$HOME/gocode
export PATH=$GOPATH/bin:/home/cpanagrosso/.vim:$PATH

export EDITOR='vim'

export NOVETTA="$GOPATH/src/github.com/Novetta"
export ELEKTRA="$NOVETTA/elektra"
export ELEKTRAFILES="$HOME/elektra/files"
export COMMON="$NOVETTA/common"
export FMS="$NOVETTA/fms"
export FBNCJS="$NOVETTA/fbncjs"
export KLE="$NOVETTA/KLE"
export KERBPROXY="$NOVETTA/kerbproxy"
export CHAT="$NOVETTA/chat/web"
export ARES="$NOVETTA/pwcop"

# Need for .vimrc extjs/react switching
export REACTON=true

# Stop tmux from renaming window
DISABLE_AUTO_TITLE=true

source ~/.alias
source ~/.git-completion.bash


export PATH="/home/cagrosso/bin/Sencha/Cmd:$PATH"
