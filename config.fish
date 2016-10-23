### fish configuration

## Function call on exit
function on_exit --on-process %self
    fish_logout
end

## Load local configuration
. ~/.config/fish/local.fish

## Load aliases
alias ls='ls --color=auto'
alias rmacs='rm -f *~ \#*\#'

## Set environment variables
setenv LANG en_US.UTF-8
setenv EDITOR emacs
setenv WORKON_HOME ~/.virtualenvs
bash /usr/bin/virtualenvwrapper.sh

## Rotating rainbow palette because it's the 90s
# This is a more "skittles" flavoured palette
#set -g rainbow 97080e da4b0f e9b104 488c13 1b55c0
# This is a more "seafoam" flavoured pallete. It fits my WM theme a little better.
set -g rainbow 346767 488d8d 93c8c8 badbdb 6ab3b3 3c7777
set -g static_rainbow $rainbow

## If `fish_onload` has been defined, run that command on startup.
## (This is kind of a duct-tapey patch around not having a run-and-interactive startup)
if set -q fish_onload
    eval $fish_onload
    set -e fish_onload
end
