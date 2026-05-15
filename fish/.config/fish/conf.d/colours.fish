if status is-interactive
    set -gx BAT_THEME Dracula

    if command --query gls
        alias ls='gls --color=auto'
    end

    if command --query tree
        alias tree='tree -C'
    end
end
