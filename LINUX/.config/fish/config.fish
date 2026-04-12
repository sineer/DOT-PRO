set -x SSH_AUTH_SOCK ~/.bitwarden-ssh-agent.sock

set -x DISABLE_AUTOUPDATER 1

# go install puts gum/sesh in ~/go/bin — must be on PATH even for non-interactive fish -c
set -q GOPATH || set -gx GOPATH $HOME/go
fish_add_path $GOPATH/bin $HOME/.local/bin

source ~/.PRO/SHARED/.config/fish/config.fish
