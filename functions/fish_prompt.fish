set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_color_merging $static_rainbow[1]
set __fish_git_prompt_color_dirtystate $static_rainbow[2]
set __fish_git_prompt_color_stagedstate $static_rainbow[3]
set __fish_git_prompt_color_cleanstate $static_rainbow[4]
set __fish_git_prompt_color_upstream $static_rainbow[4]
set __fish_git_prompt_color_branch $static_rainbow[5]
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_char_stashstate '✚'

function fish_prompt
    if test $TERM = "dumb"
        echo "\$"
    else
 		set_color normal
 		echo -n "╭⊸[$USER@"(hostname) (prompt_pwd)" ]"

        set branch (__fish_git_prompt | sed s/[\(\)]//g)
        if test -z $branch
            set branch (set_color $rainbow[1])"☯"(set_color normal)
            set -g rainbow $rainbow[2..-1 1]
        end
        echo -n "「$branch」"

        if test -n "$VIRTUAL_ENV"
            echo -n "{" (basename "$VIRTUAL_ENV") "}"
        end
        
        echo
        echo -n "╰⊸"
    end
end
