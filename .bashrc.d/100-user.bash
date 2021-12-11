# User custom directives

#
# Set locale
#

# export LC_ALL="en_US.UTF-8";
# export LC_CTYPE="en_US.UTF-8";

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

function whatismyip {
    # curl --silent checkip.dyndns.org 2>&1 |perl -e 'local $\; print( ( /<body>(.*)<\/body>/si ? $1 : "Not found" ), "\n")';
    curl --silent checkip.dyndns.org 2>&1 |perl -e 'local $\; print <> =~ /<body>(.*)<\/body>/si ? $1 : "Not found", "\n";';
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