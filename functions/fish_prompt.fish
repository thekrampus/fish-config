set fish_git_dirty_color $rainbow[2]
set fish_git_not_dirty_color $rainbow[4]
set fish_prompt_color $rainbow[5]

## Git branch parsing. Used for prompt and title.
# Depends on rainbow palette above
function parse_git_branch
    set -l branch (git branch ^/dev/null | grep -e '\*' | sed 's/^..\(.*\)/\1/')
    set -l git_diff (git diff ^/dev/null)

    if test -n "$git_diff"
        echo (set_color $fish_git_dirty_color)$branch(set_color normal)
    else
        echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
    end
end

function fish_prompt
 		 set_color normal
 		 echo -n "╭⊸[$USER@"(hostname) (prompt_pwd)" ]"
    set branch (parse_git_branch)
    if test -z $branch
        set branch (set_color $rainbow[1])"☯"(set_color normal)
        set -g rainbow $rainbow[2..-1 1]
    end
    echo "「$branch」"
    echo -n "╰⊸"
end