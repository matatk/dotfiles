function abbr_init --description 'Initializes abbreviations'
    abbr -a -- T 'tree -h --gitignore -I .git'
    abbr -a -- Ta 'tree -ah --gitignore -I .git'
    abbr -a -- Tad 'Ta -d'
    abbr -a -- Td 'T -d'
    abbr -a -- a 'ls -lha'
    abbr -a -- b 'bat -pp'
    abbr -a -- brewup 'brew update && brew upgrade'
    abbr -a -- cp 'cp -i'
    abbr -a -- cs 'command --search'
    abbr -a -- f 'kitty --single-instance --start-as fullscreen &'
    abbr -a -- g 'gvim --remote-tab'
    abbr -a -- gc 'git commit -nm'
    abbr -a -- gca 'git commit -nam'
    abbr -a -- gcam 'git commit --amend'
    abbr -a -- gcama 'git commit --amend -a'
    abbr -a -- gd 'git diff'
    abbr -a -- gds 'git diff --stat'
    abbr -a -- gl 'git log'
    abbr -a -- gla 'git log --all --decorate --oneline --graph'
    abbr -a -- glo 'git log --oneline'
    abbr -a -- glod 'git log --oneline --shortstat'
    abbr -a -- gst 'git status'
    abbr -a -- h 'ls -lh'
    abbr -a -- mv 'mv -i'
    abbr -a -- ogd "open . -a '/Applications/GitHub Desktop.app'"
    abbr -a -- rgi 'rg -i'
    abbr -a -- rm 'rm -i'
    abbr -a -- t 'tree -hI node_modules'
    abbr -a -- ta 'tree -ahI "node_modules|.git"'
    abbr -a -- tad 'ta -d'
    abbr -a -- td 't -d'
    abbr -a -- v nvim
end