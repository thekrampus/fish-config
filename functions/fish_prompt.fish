set __fish_git_prompt_showupstream            'yes'
set __fish_git_prompt_showuntrackedfiles      'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_color_merging           $static_rainbow[1]
set __fish_git_prompt_color_dirtystate        $static_rainbow[2]
set __fish_git_prompt_color_stagedstate       $static_rainbow[3]
set __fish_git_prompt_color_cleanstate        $static_rainbow[4]
set __fish_git_prompt_color_upstream          $static_rainbow[4]
set __fish_git_prompt_color_branch            $static_rainbow[5]
set __fish_git_prompt_char_upstream_ahead     '↑'
set __fish_git_prompt_char_upstream_behind    '↓'
set __fish_git_prompt_char_stashstate         '✚'

set __fish_prompt_hookup_glyph   '╭⊸'
set __fish_prompt_hookdown_glyph '╰⊸'
set __fish_prompt_hook_color     $static_rainbow[4]

set __fish_prompt_bad_status_glyph '⌥'
set __fish_prompt_bad_status_color brred

set __fish_venv_prompt_glyph '⚕'

## Should look something like this...
# ╭⊸[rob@starman ~/.c/fish ]「 master↑1|✔」{ ⚕ venv }
# ╰⊸ echo "hey imma computah! stop all th' downloadin'!"

function fish_prompt
    set p_status $status
    if test $TERM = "dumb"
        echo "\$"
    else
        # Line 1
        set p_hookup (set_color $__fish_prompt_hook_color)"$__fish_prompt_hookup_glyph"(set_color normal)

        set p_info "[$USER@"(hostname) (prompt_pwd)" ]"
        if test $p_status -ne 0
            set p_info (set_color $__fish_prompt_bad_status_color)"$p_info"(set_color normal)
        end

        set branch (__fish_git_prompt | sed s/[\(\)]//g)
        if test -z $branch
            set branch (set_color $rainbow[1])"☯"(set_color normal)
            set -g rainbow $rainbow[2..-1 1]
        end
        set p_branch "「$branch」"

        if test -n "$VIRTUAL_ENV"
            set p_venv "{ $__fish_venv_prompt_glyph"(basename "$VIRTUAL_ENV") "}"
        end

        set p_line_1 "$p_hookup$p_info$p_branch$p_venv"

        # Line 2
        set p_hookdown (set_color $__fish_prompt_hook_color)"$__fish_prompt_hookdown_glyph"(set_color normal)

        set p_line_2 "$p_hookdown"

        # Write out
        echo "$p_line_1"
        echo "$p_line_2"
    end
end

function fish_right_prompt -d "Write out the right-aligned prompt"
    set p_status $status
    if test $TERM != "dumb"
        if test $p_status -ne 0
            set_color $__fish_prompt_bad_status_color
            echo $__fish_prompt_bad_status_glyph $prompt_status
            set_color normal
        end
    end
end
