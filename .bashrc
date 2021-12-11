# load custom conf from ~/.bashrc.d

if [ -d $HOME/'.bashrc.d' ]; then
    for f in $HOME/.bashrc.d/*.bash*; do
        source $f;
    done
fi
