function universal_setup --description 'Set things up after a reinstall'
    fish_vi_key_bindings

    set -Ux EDITOR hx
    set -Ux BAT_THEME Dracula
    set -Ux DOOMWADPATH /Users/matatk/WADs

    if command --query /opt/homebrew/bin/brew
        set -f prefix /opt/homebrew
        fish_add_path $prefix/bin
    else if command --query /usr/local/bin/brew
        set -f prefix /usr/local
    end
    fish_add_path $prefix/sbin
    fish_add_path $prefix/opt/node@20/bin

    fish_add_path ~/.cargo/bin
    fish_add_path ~/bin

    echo -e "If running this after updating any paths, clear out the existing paths first:\nset -e fish_user_paths"
end
