function in-vagrant {
    # local cmd="'$*'";
    local cmd="$*";
    vagrant ssh -c "$cmd"
}