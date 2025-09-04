set -gx SSH_AUTH_SOCK /Users/j/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock

# Set tmux autoquit to false before plugins load
# XXX WHY MUST I SET THIS HERE AND WONT WORK IN
# BELLOW SHARED config.fish interactive!?!?
# ALSO IF I REMOVE THEM FROM THAT SHARED config
# THEN IT STOPS WORKING AGAIN!
set -gx fish_tmux_autoquit false

source ~/.PRO/SHARED/.config/fish/config.fish
