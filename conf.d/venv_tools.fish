## Tools for working with python virtual environments

function lsvenv --description 'List virtual environments'
    if test -e .autovenv
        # short circuit if there's an .autovenv here
        set dir (cat .autovenv)
        if __is_venv $dir
            echo $dir
            return
        end
    end

    for result in (find . -maxdepth 2 -regex '.*/\(pyvenv.cfg\|pip-selfcheck.json\)' -printf '%P\n' 2>/dev/null)
        set -l dir (dirname $result)
        if __is_venv $dir
            set venvs $venvs $dir
        end
    end

    for v in $venvs
        echo $v
    end
end

function autovenv --description 'Automatically load a virtual environment'
    for arg in $argv
        if test $arg = "-q"
            set opt_quiet 1
        end
    end

    set venvs (lsvenv)

    if test (count $venvs) -gt 1
        # Multiple venvs
        if test -z $opt_quiet
            echo "Found multiple virtualenvs"
        end
        echo $venvs
    else if test (count $venvs) -gt 0
        # Just one venv
        activate $venvs
        if test -z $opt_quiet
            echo "Loaded virtualenv $venvs"
        end
    else
        # No venvs
        if test -z $opt_quiet
            echo "No virtualenvs found."
        end
        return 1
    end
end

function tmpvenv --description 'Make and activate a temporary python virtual environment'
    if test -n "$argv[1]"
        set pybin $argv[1]
    else
        set pybin (which python)
    end

    if string match -qr 'python2' $pybin
        set venvcmd (which virtualenv2)
    else
        set venvcmd "$pybin -m venv"
    end

    set vdir (mktemp -du /tmp/tmp.venv.XXXXX)
    echo "\$ $venvcmd $vdir"
    eval $venvcmd $vdir
    activate $vdir
end

function activate --description 'Activate a virtual environment'
    source $argv/bin/activate.fish
end

function __is_venv
    test -e $argv/bin/activate.fish
end

function __autovenv_on_cwd --on-variable PWD --description 'Automatically load a virtual environment when changing directories'
    if status is-command-substitution; or test -z "$AUTOVENV"; or test -n "$VIRTUAL_ENV"
    # Prevent autofire on command substitution or if a virtualenv is loaded
        return
    end

    autovenv -q &
end
