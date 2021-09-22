# User custom directives

#
# Set locale
#

# export LC_ALL="en_US.UTF-8";
# export LC_CTYPE="en_US.UTF-8";

#
# Setup home bin directory
#

if [ -d ~/bin ]; then
    export PATH="~/bin:$PATH"
fi

#
# Setup home tmp directory
#

if [ ! -d /tmp/user/$USER ]; then
    mkdir -p /tmp/user/$USER
fi

if [ ! -e $HOME/tmp ]; then
    ln -s /tmp/user/$USER $HOME/tmp
fi

#
# Setup command line prompt
#

export PROMPT="\[\e[32m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\n$ " # compatible with bash-it
export PS1="$PROMPT"

#
# Setup utility functions
#

function mkcd {
    mkdir -p $1 && cd $1
}

function portopentcp {
    sudo iptables -I INPUT 1 -p tcp -m tcp --dport $1 -j ACCEPT
}

function portclosetcp {
    sudo iptables -I INPUT -p tcp -m tcp --dport $1 -j REJECT
}

#
# Setup utility aliases
#

alias codedate='\date +"%Y%m%d%H%M%S"'
alias date='\date +"%Y-%m-%d %H:%M:%S"'
alias ls='ls --color=auto -a'
alias vi='vim'
alias view="vim -M"

#
# Export variables
#

export VISUAL=vim
export EDITOR="$VISUAL"