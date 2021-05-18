local apps = {
   terminal = 'st',
   file_manager = 'st -e vifm',
   -- file_manager = 'thunar',
   news = 'st -e newsboat',
   email = 'st -e neomutt',
   text_editor = 'st -e nvim',
   vscode = 'code',
   image_viewer = 'sxiv',
   photo_editor = 'gimp',
   screen_recorder = os.getenv('HOME') .. '/.local/bin/dmenu_ffmpeg',
   screenshoot = os.getenv('HOME') .. '/.local/bin/maimpick',
   launcher = 'rofi -show',
   music = 'st -e ncmpcpp',
   firefox = 'firefox',
   sysact = os.getenv('HOME') .. '/.local/bin/sysact',
   mount = os.getenv('HOME') .. '/.local/bin/dmenu_mount',
   unmount = os.getenv('HOME') .. '/.local/bin/dmenu_umount',
   clipboard = 'CM_LAUNCHER=rofi clipmenu',
   password = 'rofi-pass',
   network = os.getenv('HOME') .. '/.local/bin/networkmanager_dmenu',
   systemd = os.getenv('HOME') .. '/.local/bin/dmenu_systemd',
   kill_process = os.getenv('HOME') .. '/.local/bin/dmenu_kill',
}
return apps
