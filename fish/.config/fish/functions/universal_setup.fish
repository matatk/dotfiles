function universal_setup --description 'Set things up after a reinstall'
    set -Ux EDITOR hx
    set -Ux BAT_THEME Dracula
    set -Ux DOOMWADPATH $HOME/WADs

    set -U fish_key_bindings fish_vi_key_bindings

    fish_add_path ~/.cargo/bin
    fish_add_path ~/bin

    if ! functions --query fisher
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    end
    fisher update
    echo

    echo -e "If running this after updating any paths, clear out the existing paths first, with:\n\tset -e fish_user_paths\n\tuniversal_setup"
end
