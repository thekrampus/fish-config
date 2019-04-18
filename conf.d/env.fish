### Set environment variables

# Run once on login
if status --is-login
    setenv LANG en_US.UTF-8
    setenv EDITOR emacs
    setenv VIRTUAL_ENV_DISABLE_PROMPT 1
    setenv LESS "--RAW-CONTROL-CHARS"
    setenv LESSOPEN "| highlight --line-numbers --force -O xterm256 -s darkspectrum %s"

    set -x PATH $HOME/bin /usr/sbin /sbin /usr/local/sbin $PATH

    ## Load local environment variables
    source ~/.config/fish/local.d/env.fish
end
