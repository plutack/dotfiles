function gc --wraps=fish_clipboard_copy --description 'alias gc=fish_clipboard_copy'
    if test -n "$argv"
        # If a file is passed as an argument, copy its contents to the clipboard
        if test -f "$argv[1]"
            cat "$argv[1]" | fish_clipboard_copy
        else
            echo "File not found or invalid."
        end
    else
        # If data is being piped, copy the piped data to the clipboard
        if not isatty 0
            cat | fish_clipboard_copy
        else
            echo "Nothing to copy"
        end
    end
end
