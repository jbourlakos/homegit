# ensure Documents

if [ ! -d $HOME/Documents ]; then
    mkdir $HOME/Documents;
fi

# Home-git directives

alias homegit='/usr/bin/env git --git-dir=$HOME/Documents/.homegit/ --work-tree=$HOME'

# Setup home bin directory

if [ -d $HOME/bin ] && [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    export PATH="$HOME/bin:$PATH"
fi

# Setup home tmp directory

if [ ! -d /tmp/user/$USER ]; then
    mkdir -p /tmp/user/$USER
fi

if [ ! -e $HOME/tmp ]; then
    ln -s /tmp/user/$USER $HOME/tmp
fi
