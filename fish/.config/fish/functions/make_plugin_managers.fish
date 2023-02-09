function make_plugin_managers --description 'Make plugin_freeze and plugin_unfreeze functions'
	set -l plugin_repos ~/.local/share/nvim/site/pack/paqs/start

    set -l plugin_freeze $HOME/.config/fish/functions/plugin_freeze.fish
    echo "function plugin_freeze --description 'Check out specific plugin commits'" > "$plugin_freeze"

    set -l plugin_unfreeze $HOME/.config/fish/functions/plugin_unfreeze.fish
    echo "function plugin_unfreeze --description 'Check out the previous branch'" > "$plugin_unfreeze"

	for repo in $plugin_repos/*
		set -l latest (string split -f1 ' ' (git --git-dir $repo/.git log -1 --oneline))
		echo git --git-dir $repo/.git checkout $latest >> "$plugin_freeze"
		echo git --git-dir $repo/.git checkout - >> "$plugin_unfreeze"
	end

    echo end >> "$plugin_freeze"
    fish_indent -w "$plugin_freeze"

    echo end >> "$plugin_unfreeze"
    fish_indent -w "$plugin_unfreeze"
end
