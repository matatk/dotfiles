if status is-interactive
    abbr_init

    if command --query gls
        alias ls='gls --color=auto'
    end

    if command --query tree
        alias tree='tree -C'
    end
end
