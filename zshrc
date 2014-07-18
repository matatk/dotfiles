# Completion
autoload -Uz compinit && compinit
# case-insensitive (uppercase from lowercase) completion
# http://hintsforums.macworld.com/archive/index.php/t-6493.html
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Colours
export CLICOLOR=1                       # BSD
export LSCOLORS=ExgxfxdxcxGxDxabagacad  # BSD
# Linux-style -- http://geoff.greer.fm/lscolors/ (had to fix dir colour)
export LS_COLORS="di=1;34;40:ln=36;40:so=35;40:pi=33;40:ex=32;40:bd=1;;40:cd=1;;40:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
zstyle ':completion:*:default' list-colors ${LS_COLORS}
export GREP_OPTIONS='--color=auto'

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

# Prompt
autoload -Uz colors && colors
setopt prompt_subst
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT="${ret_status} %{$fg[blue]%}%c % %{$reset_color%}"
local git_branch='$(git branch --no-color 2> /dev/null \
	| sed -e "s/* \(.*\)/\1/")'
RPROMPT="%{$fg[yellow]%}${git_branch}%{$reset_color%}"
