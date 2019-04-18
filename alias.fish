### Set aliases
alias ls="ls --color=auto"
alias ll="ls -alh"
alias rmacs="rm -f {*~,\#*\#}"
alias g="git"

alias emacs="emacs -nw"
alias xemacs="command emacs"
alias cemacs="emacsclient -t"

alias matlab="matlab -nodesktop -nosplash"
alias xmatlab="command matlab"

alias octave="octave --no-gui"
alias xoctave="command octave"

function urxvt_clone
    urxvt -cd $PWD &
end

## Load local aliases
. ~/.config/fish/local.d/alias.fish
