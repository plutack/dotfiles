function fzfedit --wraps='fzf | xargs hx' --description 'alias fzfedit=fzf | xargs hx'
    # Set the target directory to the argument if provided, otherwise default to current directory
    set -l target_dir (test -n "$argv"; and echo "$argv[1]"; or echo ".")

    # Use fzf in the target directory
    set -l selection (find $target_dir -type f -or -type d | fzf --preview 'cat {}' --preview-window=right:60%)

    if test -n "$selection"
        if test -f "$selection"
            hx $selection
        else if test -d "$selection"
            ls "$selection"
        else
            echo "Invalid command"
        end
    else
        echo "No selection made."
    end
end
