DOTFILES=~/.dotfiles  # Doing it this way allows shellcheck to work
source "$DOTFILES/shell/environment.sh"
source "$DOTFILES/shell/completions.sh"
source "$DOTFILES/shell/colours.sh"
source "$DOTFILES/shell/commands.sh"

PS1="\[\033[0;1;32m\]\u@\h:\[\033[0;1;34m\]\w\[\033[0;1;33m\]\$ \[\033[0m\]"

# HOMEBREW_PREFIX is defined in environment.sh
if [ -f "$HOMEBREW_PREFIX/etc/bash_completion" ]; then
	source "$HOMEBREW_PREFIX/etc/bash_completion"
fi

command -v pip3 > /dev/null && \
	eval "$(pip3 completion --bash)" && \
	complete -o default -F _pip_completion pip3

# https://github.com/direnv/direnv/wiki/Python
show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename "$VIRTUAL_ENV"))"
  fi
}
export -f show_virtual_env
PS1='$(show_virtual_env)'$PS1

eval "$(direnv hook bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source "$DOTFILES/shell/startup-sequence.sh"
unset DOTFILES
