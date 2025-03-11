use std/util "path add"

$env.config.show_banner = false

$env.EDITOR = 'hx'
{{ if ne .chezmoi.os "windows" -}}
$env.DOOMWADPATH = $'($env.HOME)/wads'
{{- end }}

use {{ joinPath .chezmoi.sourceDir "prompt.nu" | quote }} [matatk_left_prompt, matatk_right_prompt]
$env.PROMPT_COMMAND = { matatk_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { matatk_right_prompt }
$env.PROMPT_INDICATOR = " "

{{ if ne .chezmoi.os "windows" -}}
path add "~/bin"
path add "~/.cargo/bin"
{{- end }}
{{ if eq .chezmoi.os "darwin" -}}
path add "/opt/homebrew/bin"
{{- end }}

alias T = tree -h --gitignore -I .git
alias Ta = tree -ah --gitignore -I .git
alias Tad = Ta -d
alias Td = T -d
alias a = ls -a
alias b = bat -p --tabs 4
alias bb = bat -pp --tabs 4
alias ci = cargo install --path .
alias cl = cargo clippy
alias cm = chezmoi
alias cma = chezmoi apply --verbose --dry-run
alias cmar = chezmoi apply --verbose
alias cmc = cd {{ .chezmoi.sourceDir | quote }}
alias cmi = chezmoi ignored
alias cmm = chezmoi managed
alias coi = cargo --offline install --path .
alias col = cargo --offline clippy
alias cot = cargo --offline test
alias cp = cp -i
alias cs = command --search
alias ct = cargo test
alias ct = cargo test
alias f = kitty --single-instance --start-as fullscreen --session none &
alias g = gvim --remote-tab
alias gc = git commit -m
alias gca = git commit -am
alias gcm = git commit --amend
alias gcma = git commit --amend -a
alias gd = git diff
alias gds = git diff --stat
alias gl = git log
alias gla = git log --all --decorate --oneline --graph
alias glo = git log --oneline
alias glod = git log --oneline --shortstat
alias gP = git push
alias gp = git pull
alias gst = git status
alias l = ls
alias mv = mv -i
alias ogd = /usr/bin/open . -a '/Applications/GitHub Desktop.app'
alias rcoi = cargo --offline install --path .
alias rgi = rg -i
alias rm = rm -i
alias t = tree -hI node_modules
alias ta = tree -ahI "node_modules|.git"
alias tad = ta -d
alias td = t -d
