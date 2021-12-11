sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

alias config="/usr/bin/git --git-dir $HOME/.cfg/ --work-tree=$HOME"
git clone --bare https://www.github.com/mkadit/dotfile.git $HOME/.cfg
config checkout
config config --local status.showUntrackedFiles no

paru -S abook alsa-utils atool awesome-git base-devel bat bluez brightnessctl btop clipmenu cronie curl dmenu dosfstools downgrade dunst exfat-utils exiv2 fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool fcitx5-mozc fcitx5-nord fd ffmpeg fzf git gnome-keyring gnupg htop imagemagick isync jq libnotify lxsession man-db mediainfo mpc mpd mpv msmtp mutt-wizard ncmpcpp neofetch neomutt newsboat nerd-fonts-jetbrains-mono ncdu nordic-theme-git notmuch ntfs-3g openssh pamixer papirus-nord pass pavucontrol picom playerctl poppler pulseaudio pulseaudio-alsa qutebrowser rclone ripgrep rmlint rofi simple-mtpfs slop sxiv thunar tmux ueberzug unclutter unrar unzip urlview vieb-bin vifm xclip xdotool xorg-server xorg-xbacklight xorg-xdpyinfo xorg-xinit xorg-xprop xorg-xsetroot xorg-xwininfo xwallpaper yt-dlp-git yt-dlp-drop-in zathura zathura-pdf-mupdf zsh zsh-autocomplete-git zsh-fast-syntax-highlighting ip-route2 wireless-tools obmenu-generator openbox plank tint3 gsimplecal lxappearance lxpolkit

chsh -s $(which zsh)
fc-cache -rv
sudo chmod u+s $(command -v brightnessctl)

sudo pacman -S base-devel cmake unzip ninja tree-sitter curl

mkdir github
git clone https://github.com/neovim/neovim
git clone https://github.com/mafredri/zsh-async
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


cd neovim
sudo make install
