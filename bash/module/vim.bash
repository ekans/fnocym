if ! hash vim 2>/dev/null
then
    echo "Vim module not loaded"
    return
fi

export EDITOR=vim
