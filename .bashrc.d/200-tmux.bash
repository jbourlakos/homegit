# Tmux

#
# Predictable SSH authentication socket location.
#

# See also: $HOME/.tmux.conf
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]; then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

# Default tmux session
alias tmux0='tmux attach-ses -t 0 || tmux new-ses -s 0'
