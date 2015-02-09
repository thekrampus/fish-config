# Yields the current progress of a cp invocation, as a decimal
# Note: Doesn't really work for recursive cp
function cp_meter
    # Get most recent cp invocation
    set cpid (pgrep -nx cp)

    if test -z $cpid
        # No cp invocation! Oh no!
        return -1
    end

    # 7th column of last two lines are size of input and output, respectively
    set cp_status (lsof -p$cpid | tail -n2 | awk '{print $7}')

    # Divide size of output by size of input for percent of data copied
    set cp_progress (math "100.0 * $cp_status[2].0 / $cp_status[1].0" | head -c5)
    echo $cp_progress
end

# Force floating-point precision in bc (and thus math)
function bc
    command bc -l $argv
end
