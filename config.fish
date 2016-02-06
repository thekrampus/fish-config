### fish configuration

## Function call on exit
function on_exit --on-process %self
    fish_logout
end

## Load aliases
alias ls='ls --color=auto'
alias matlab='matlab -nodesktop -nosplash'
alias xmatlab='command matlab'
alias octave='octave --no-gui'
alias xoctave='command octave'
alias ptop='ptop -t light'
alias rmacs='rm -f *~ \#*\#'
function urxvt_clone
    urxvt -cd $PWD &
end

## Set environment variables
setenv LANG en_US.UTF-8
setenv EDITOR emacs
setenv BROWSER chromium
setenv WORKON_HOME ~/.virtualenvs
bash /usr/bin/virtualenvwrapper.sh

## Start X at login
if status --is-login
    # Set path
    setenv PATH $PATH $HOME/bin /usr/sbin /sbin /usr/local/sbin /opt/anaconda/bin
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx
    end
end

## Rotating rainbow palette because it's the 90s
# This is a more "skittles" flavoured palette
#set -g rainbow 97080e da4b0f e9b104 488c13 1b55c0
# This is a more "seafoam" flavoured pallete. It fits my WM theme a little better.
set -g rainbow 346767 488d8d 93c8c8 badbdb 6ab3b3 3c7777
set -g static_rainbow $rainbow