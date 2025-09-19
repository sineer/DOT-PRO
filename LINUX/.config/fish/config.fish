set -x SSH_AUTH_SOCK ~/.bitwarden-ssh-agent.sock

set -x DISABLE_AUTOUPDATER 1

# TMUX - set these BEFORE they might be used                                                                                                       
set -gx fish_tmux_autoconnect false
set -gx fish_tmux_autostart_once false
set -gx fish_tmux_autostart false
set -gx fish_tmux_autoquit false

source ~/.PRO/SHARED/.config/fish/config.fish
