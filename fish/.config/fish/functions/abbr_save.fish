# Based on https://www.reddit.com/r/fishshell/comments/k2zx7m/comment/gdytxlr/
function abbr_save --description 'Save the definition of all abbreviations'
    set -l abbr_init $HOME/.config/fish/functions/abbr_init.fish
    echo "function abbr_init --description 'Initializes abbreviations'" > "$abbr_init"
    abbr | sort >> "$abbr_init"
    echo end >> "$abbr_init"
    fish_indent -w "$abbr_init"
end
