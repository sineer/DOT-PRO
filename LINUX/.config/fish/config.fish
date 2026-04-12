set -x SSH_AUTH_SOCK ~/.bitwarden-ssh-agent.sock

set -x DISABLE_AUTOUPDATER 1

source ~/.PRO/SHARED/.config/fish/config.fish

if status is-interactive
    set -gx fish_tmux_autoconnect false
    set -gx fish_tmux_autostart_once false
    set -gx fish_tmux_autostart false
    set -gx fish_tmux_autoquit false
end
