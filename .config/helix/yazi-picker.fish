#!/usr/bin/env fish

# $argv[1] = first argument
# $argv[2] = second argument

# Capture yazi output and escape each path
set paths ""
yazi $argv[2] --chooser-file=/dev/stdout | while read -l line
    # fish equivalent of printf "%q"
    set escaped (string escape -- $line)
    set paths "$paths$escaped "
end

if test -n "$paths"
    zellij action toggle-floating-panes
    zellij action write 27 # send Escape
    zellij action write-chars ":$argv[1] $paths"
    zellij action write 13 # send Enter
else
    zellij action toggle-floating-panes
end
