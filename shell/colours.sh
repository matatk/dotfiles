# Use GNU dircolors and GNU ls to get pretty and configurable listings
if [ "$(uname -s)" = 'Darwin' ]; then
	eval "$(gdircolors)"
else
	eval "$(dircolors)"  # Needed for tree
fi

# Ask grep to use colours
alias grep='grep --color=auto'
