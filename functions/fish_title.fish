function fish_title
    echo "「$_」 "
    switch $_
        case 'htop'
        case 'irssi'
        case '*'
            pwd
    end
end