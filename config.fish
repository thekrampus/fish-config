### fish configuration

## Set path
set PATH $PATH $HOME/bin /usr/sbin /sbin /usr/local/sbin /opt/anaconda/bin

## Disable title message
function fish_title
end

## Function call on exit
function on_exit --on-process %self
		 fish_logout
end

## Load aliases
alias ls='ls --color=auto'

## Set environment variables
set -U EDITOR emacs
set -U BROWSER chromium
set -U WORKON_HOME ~/.virtualenvs
bash /usr/bin/virtualenvwrapper.sh

# Start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx
    end
end