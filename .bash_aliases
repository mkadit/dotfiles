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
alias bassh="ssh -L 6969:db.cs.ui.ac.id:5432 -i ~/muhammad.krishertanto_kawung.key muhammad.krishertanto@kawung.cs.ui.ac.id -p 12122"
alias vbg='xwinwrap -ov -fs -fdt -ni -b -nf -un -o 1.0 -debug -- mpv -wid WID --loop --no-audio'
alias ynvidia="__GL_THREADED_OPTIMIZATIONS=1 yuzu"
alias man="fzf_man"

# youtube-dl
alias ytdl="yt-dlp --add-metadata --embed-thumbnail"
alias ytdlm="yt-dlp --add-metadata --embed-thumbnail -f bestaudio --extract-audio --audio-format mp3 -o '~/Music/%(title)s.%(ext)s'"
alias ytdlv="yt-dlp --add-metadata --embed-thumbnail -f bestvideo+bestaudio -o '~/Videos/%(title)s.%(ext)s'"

# Package
QPAS='pacman -Si {1}'
QYAS='yay -Si {1}'
QPAR='pacman -Qi {1}'
QYAR='yay -Qi {1}'
QAAS='paru -Si {1}'
QAAR='paru -Qi {1}'
alias pas='pacman -Slq | fzf -m --preview ${QPAS} | xargs -ro sudo pacman -S'
alias yas='yay -Slq | fzf -m --preview ${QYAS} | xargs -ro  yay -S'
alias par='pacman -Qqe | fzf -m --preview ${QPAR} | xargs -ro sudo pacman -Rns'
alias yar='yay -Qqe | fzf -m --preview ${QYAR} | xargs -ro  yay -Rns'
alias aas='paru -Slq | fzf -m --preview ${QAAS} | xargs -ro  paru -S'
alias aar='paru -Qqe | fzf -m --preview ${QAAR} | xargs -ro  paru -Rns'

#Tmux
alias tmn="tmux new -s"
alias tma="tmux a -t"

# Git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=/$HOME'
alias gac='git add $1 && git commit -m "\$2"'
alias ggC='git commit -m $1'
alias ggP='git push $1 $2'
alias ggR='git reset'
alias ggc='git checkout'
alias ggg='git pull; git add -A; git commit -m \"$1\"; git push;'
alias ggm='git merge $1'
alias ggp='git pull origin $1'
alias ggr='git revert'
alias ggs='git status'
alias ggf='git fetch'
alias gga='git add'
alias glog='git log --all --decorate --oneline --graph'
