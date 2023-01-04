# User custom directives

#
# Set locale
#

# export LC_ALL="en_US.UTF-8";
# export LC_CTYPE="en_US.UTF-8";

#
# Setup command line prompt
#

# Default
export PROMPT="\[\e[32m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\n$ " # compatible with bash-it
export PS1="$PROMPT"

# Enable magicmonty/bash-git-prompt
if [ ! -d $HOME/.bash-git-prompt ]; then
    echo 'Missing bash-git-prompt.'
    echo 'Install using: `git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1`'
else
    if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
        GIT_PROMPT_ONLY_IN_REPO=1
        GIT_PROMPT_THEME="Solarized_Ubuntu"
        source $HOME/.bash-git-prompt/gitprompt.sh
    fi
fi

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
    curl --silent checkip.dyndns.org 2>&1 | perl -e 'local $\; print <> =~ /<body>(.*)<\/body>/si ? $1 : "Not found", "\n";'
}

function gg {
    if command -v perl >/dev/null 2>&1; then
        grep_cmd="grep -P"
    else
        grep_cmd="grep"
    fi

    if command -v git >/dev/null 2>&1; then
        if git rev-parse --git-dir >/dev/null 2>&1; then
            git "$grep_cmd" "$@"
        else
            "$grep_cmd" "$@"
        fi
    else
        "$grep_cmd" "$@"
    fi
}

#
# Setup utility aliases
#

alias codedate='\date +"%Y%m%d%H%M%S"'
# alias date='\date +"%Y-%m-%d %H:%M:%S"'
alias ls='ls --color=auto -a'
alias vi='vim'
alias view="vim -M"

#
# Export variables
#

export VISUAL=vim
export EDITOR="$VISUAL"
