
    # load custom conf from ~/.bashrc.d - one file
    if [ -f $HOME/'.bashrc.d/one' ]; then
        source $HOME/'.bashrc.d/one';
    fi


    # load custom conf from ~/.bashrc.d
    if [ -d $HOME/'.bashrc.d' ]; then
        for f in $HOME/.bashrc.d/*.bash; do
            source $f;
        done
    fi
