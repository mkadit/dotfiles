# QT theme
export QT_QPA_PLATFORMTHEME=qt5ct  
export QT_AUTO_SCREEN_SCALE=1
export QT_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTOR=1

# Clipmenu
export CM_LAUNCHER=rofi
export CM_DIR=/tmp/clipmenu

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/statusbar:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

#FZF
export FZF_DEFAULT_COMMAND='fd --hidden --follow --ignore-file=$HOME/.gitignore --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type f"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"


# EDITOR
export EDITOR="nvim"
. "$HOME/.cargo/env"

# fcitx
export GLFW_IM_MODULE="ibus"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"
export SDL_IM_MODULE="fcitx"
export IBUS_USE_PORTAL=1
