if status is-interactive

    #set -gz ANTHROPIC_BASE_URL http://localhost:8080
    #set -gx PAGER nvimpager
    #set -gx VIRTUAL_ENV_DISABLE_PROMPT true

    set -gx COLORTERM truecolor
    set -gx EDITOR zed
    set -gx LANG en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8

    set -gx GOPATH $HOME/go
    set -x PATH $GOPATH/bin $HOME/.local/bin $HOME/.node_modules/bin $PATH
    set -gx DOCKER_BUILDKIT 1
    set -gx COMPOSE_DOCKER_CLI_BUILD 1

    #set -g fish_key_bindings fish_vi_key_bindings
    #set -g fish_bind_mode insert
    fish_default_key_bindings

    # Title options - Modified for tmux window naming
    set -g theme_title_display_process yes
    set -g theme_title_display_path no
    set -g theme_title_display_user no
    set -g theme_title_use_abbreviated_path no

    # Prompt options
    set -g theme_display_ruby no
    set -g theme_display_virtualenv no
    set -g theme_display_vagrant no
    set -g theme_display_vi no
    set -g theme_display_k8s_context no # yes
    set -g theme_display_user yes
    set -g theme_display_hostname yes
    set -g theme_show_exit_status yes
    set -g theme_git_worktree_support no
    set -g theme_display_git yes
    set -g theme_display_git_dirty yes
    set -g theme_display_git_untracked yes
    set -g theme_display_git_ahead_verbose yes
    set -g theme_display_git_dirty_verbose yes
    set -g theme_display_git_master_branch yes
    set -g theme_display_date yes
    set -g theme_display_cmd_duration yes
    set -g theme_powerline_fonts yes
    set -g theme_nerd_fonts yes
    set -g theme_color_scheme solarized-dark

    bind -M insert \cg forget

    # TMUX - set these BEFORE they might be used
    set -gx fish_tmux_autoconnect false
    set -gx fish_tmux_autostart_once false
    set -gx fish_tmux_autostart true
    set -gx fish_tmux_autoquit false

    # `ls` → `ls -laG` abbreviation
    abbr -a -g ls ls -laG

    # `ls` → `eza` abbreviation
    # Requires `brew install exa`
    if type -q eza
        abbr --add -g ls 'eza --long --classify --all --git --tree --level 1'
    end

    # `cat` → `bat` abbreviation
    # Requires `brew install nvimpager'
    if type -q nvimpager
        abbr --add -g cat nvimpager
    end

    # `zoxide` → `z` abbreviation
    # Requires `brew install zoxide
    if type -q bat
        abbr --add -g z zoxide
    end

    # `vi` → `nvim` abbreviation
    # Requires `brew install neovim
    if type -q nvim
        abbr --add -g vi nvim
    end

    # `c` → `cursor` abbreviation
    if type -q cursor
        abbr --add -g e cursor
    end

    # `e` → `zed` abbreviation
    if type -q zed
        abbr --add -g e zed
    end

    # `tar` → `gtar` abbreviation
    # Requires `brew install gtar
    if type -q gtar
        abbr --add -g tar gtar
    end

    if type -q claude
        abbr --add -g cc claude --dangerously-skip-permissions
    end

    abbr --add -g dc docker compose
end
