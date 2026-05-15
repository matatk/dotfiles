set -gx VISUAL hx
set -gx DOOMWADPATH ~/WADs

fish_add_path /usr/lib/cargo/bin # TODO: Only on Debian
fish_add_path /opt/homebrew/opt/rustup/bin # TODO: Only on macOS (brew)
fish_add_path ~/.cargo/bin # TODO: Not on macOS (brew)?
fish_add_path ~/.local/bin

if command --query brew
    eval "$(/opt/homebrew/bin/brew shellenv fish)"
end
