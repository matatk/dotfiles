if status is-interactive
    if command --query gls
        alias ls='gls --color=auto'
    end

    if command --query tree
        alias tree='tree -C'
    end

    if command --query brew
        eval "$(/opt/homebrew/bin/brew shellenv fish)"
    end
end
