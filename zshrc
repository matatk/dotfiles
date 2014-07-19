# Completion
autoload -Uz compinit && compinit
# http://hintsforums.macworld.com/archive/index.php/t-6493.html
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # uppercase-insensitive
zstyle ':completion:*' menu select #=n
# Gentoo docs didn't explain how these work...
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Colours
export CLICOLOR=1                       # BSD
export LSCOLORS=ExgxfxdxcxGxDxabagacad  # BSD
# Linux-style -- http://geoff.greer.fm/lscolors/ (had to fix dir colour)
export LS_COLORS="di=1;34;40:ln=36;40:so=35;40:pi=33;40:ex=32;40:bd=1;;40:cd=1;;40:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
export GREP_OPTIONS='--color=auto'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Convenience commands
alias l='ls -CF'
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -A'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Ugly commands
alias fixowmenu='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias jt='jekyll serve --watch --host obviate.local'
catsay() {
	cat $1 && say -f $1
}
alias cs=catsay

# Paths
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Editor is used by git commit et al
export EDITOR=/usr/bin/vim

# Prompt
autoload -Uz colors && colors
setopt prompt_subst
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/robbyrussell.zsh-theme
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT="${ret_status} %{$fg[blue]%}%c % %{$reset_color%}"
# http://www.jukie.net/~bart/blog/zsh-git-branch2
local git_branch='$(git branch --no-color 2> /dev/null \
	| sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/")'
RPROMPT="%{$fg[yellow]%}${git_branch}%{$reset_color%}"

# Autocorect
# (requires 'colors')
setopt correct
SPROMPT="Correct $fg_bold[red]%R$reset_color to $fg_bold[green]%r?$reset_color (Yes, No, Abort, Edit) "

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt hist_ignore_dups
# histroy search using any already-typed stuff as beginning
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Directory stack
DIRSTACKSIZE=8
setopt autopushd
setopt pushd_minus
setopt pushd_silent
setopt pushd_to_home
setopt pushd_ignore_dups
alias dh='dirs -v'

# Helpful
setopt extendedglob  # awesome globbing
setopt auto_cd       # just type directory name
setopt no_clobber    # don't overwrite existing files
#setopt beep
#setopt nomatch
#setopt notify
