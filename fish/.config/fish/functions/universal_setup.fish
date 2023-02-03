function universal_setup --description 'Set things up after a reinstall'
	fish_vi_key_bindings

	set -Ux EDITOR vim
	set -Ux BAT_THEME Dracula

	if command --query /opt/homebrew/bin/brew
		set -f prefix /opt/homebrew
		fish_add_path $prefix/bin
	else if command --query /usr/local/bin/brew
		set -f prefix /usr/local
	end
	fish_add_path $prefix/sbin
	fish_add_path $prefix/opt/node@16/bin
	fish_add_path $prefix/opt/python@3.10/libexec/bin

	fish_add_path ~/bin
end
