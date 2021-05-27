alias v='nvim'
alias cl='clear;echo ""'
alias h='history'
alias mv='mv -i'
alias rm='rm -i'
alias sss='. ~/.profile'
alias ls="ls -hN --color=auto --group-directories-first"
alias l="ls"
alias ll="ls -al"
alias vifm="vifmrun"
alias bassh="ssh -i muhammad.krishertanto_kawung.key muhammad.krishertanto@kawung.cs.ui.ac.id -p 12122"

# youtube-dl
alias ytdlm="youtube-dl -f bestaudio --extract-audio --audio-format mp3 -o '~/Music/%(title)s.%(ext)s'"
alias ytdlv="youtube-dl -f bestvideo+bestaudio -o '~/Videos/%(title)s.%(ext)s'"


# Package
QPAS='pacman -Si {1}'
QYAS='yay -Si {1}'
QPAR='pacman -Qi {1}'
QYAR='yay -Qi {1}'
alias pas='pacman -Slq | fzf -m --preview ${QPAS} | xargs -ro sudo pacman -S'
alias yas='yay -Slq | fzf -m --preview ${QYAS} | xargs -ro  yay -S'
alias par='pacman -Qqe | fzf -m --preview ${QPAR} | xargs -ro sudo pacman -Rns'
alias yar='yay -Qqe | fzf -m --preview ${QYAR} | xargs -ro  yay -Rns'

#Tmux
alias tmn="tmux new -s"
alias tma="tmux a -t"

# Git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=/$HOME'
alias ggc='git checkout'
alias ggr='git revert'
alias ggR='git reset'
alias ggC='git commit -m "$1"'
alias ggp='git push origin $1'
alias gac='git add -A && git commit'
alias ggg='git pull; git add -A; git commit -m "$1"; git push;'
alias glog='git log --all --decorate --oneline --graph'
