### fish configuration

## Function call on exit
function on_exit --on-process %self
    fish_logout
end

## Load aliases
alias ls='ls --color=auto'

function urxvt_clone
    urxvt -cd $PWD &
end

## Set environment variables
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
set -g rainbow 97080e da4b0f e9b104 488c13 1b55c0
set -g static_rainbow $rainbow