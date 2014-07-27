################################
# Completion
################################

# ZSH Completions
fpath=(~/.zsh-completions/src $fpath)

autoload -Uz compinit && compinit

# Case-insensitive completion
#  -- http://hintsforums.macworld.com/archive/index.php/t-6493.html
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # uppercase-insensitive

# Present a selection list for completion options
zstyle ':completion:*' menu select #=n

# Gentoo docs didn't explain how these work...
# show completion categories (bold) in descriptions
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
# show a warning when no matches are found
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'


################################
# Colours
################################

# BSD-style stuff
export CLICOLOR=1
export LSCOLORS=ExgxfxdxcxGxDxabagacad

# Linux-style -- http://geoff.greer.fm/lscolors/ (had to fix dir colour)
export LS_COLORS="di=1;34;40:ln=36;40:so=35;40:pi=33;40:ex=32;40:bd=1;;40:cd=1;;40:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

# Use the above colours when completing file/directory names
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Ask grep to use colours
export GREP_OPTIONS='--color=auto'


################################
# Aliases [not related to other config areas]
################################

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


################################
# Environment
################################

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=/usr/bin/vim  # used by git commit et al


################################
# Prompt
################################

autoload -Uz colors && colors
setopt prompt_subst  # allows us to run the prompt code as a command at runtime

# Show a green or red arrow depending on exit status of last command
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/robbyrussell.zsh-theme
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT="${ret_status} %{$fg[blue]%}%c % %{$reset_color%}"

# Show current branch when in a git repository
# http://www.jukie.net/~bart/blog/zsh-git-branch2
# Needs prompt_subst as it's run as a command when computing the prompt
local git_branch='$(git branch --no-color 2> /dev/null \
	| sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/")'
RPROMPT="%{$fg[yellow]%}${git_branch}%{$reset_color%}"


################################
# Autocorrect
################################

# (requires 'colors')
setopt correct  # suggest/correct command names
                # note: correct_all would do the same for arguments as well

# Use a more verbose prompt, with green and red colouring
SPROMPT="Correct $fg_bold[red]%R$reset_color to $fg_bold[green]%r?$reset_color (Yes, No, Abort, Edit) "


################################
# History
################################

HISTFILE=~/.histfile       # Note: no need to export; commands don't need this
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt append_history      # add to shared history file
setopt hist_ignore_dups    # ignore commands repeated in a row
                           # note: ignore_all_dups ignore non-adjacent ones
alias gh='history | grep'  # grep the history!

# Histroy search using any already-typed stuff as beginning
#  * If line is empty: move up/down in history; put cursor at end of line
#  * Else: move up/down history lines matching up to cursor; put cursor at end
# Note: this will work sensibly when navigating multi-line commands.

# Load the scripts; add to the line editor; bind keys
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Useful info:
#  * https://bbs.archlinux.org/viewtopic.php?pid=1170300
#  * http://unix.stackexchange.com/questions/97843/how-can-i-search-history-with-what-is-already-entered-at-the-prompt-in-zsh


################################
# Directory stack
################################

DIRSTACKSIZE=8
setopt auto_pushd         # automatically add dirs to the stack
setopt pushd_minus        # flip meaning of +/- (easier for typing; makes sense)
setopt pushd_silent       # don't be verbose about adding dirs to stack
setopt pushd_to_home      # just entering 'pushd' goes ~
setopt pushd_ignore_dups  # ignore changing to the same dir
alias dh='dirs -v'        # remember: can also complete 'cd -' to get the list


################################
# Helpful
################################

setopt extended_glob  # awesome globbing; examples: http://www.refining-linux.org/archives/37/ZSH-Gem-2-Extended-globbing-and-expansion/
setopt auto_cd        # just type directory name
                      # remember: can tab-complete paths such as /u/l/b too
setopt no_clobber     # don't overwrite existing files
