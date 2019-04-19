# command-line markdown viewer shortcut
function md-view
    pandoc $argv | lynx -stdin
end
