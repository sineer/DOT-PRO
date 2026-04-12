if status is-interactive

    #set -gx PAGER nvimpager
    #set -gx VIRTUAL_ENV_DISABLE_PROMPT true

    set -gx COLORTERM truecolor
    if type -q zed
        set -gx EDITOR zed
    else if type -q nvim
        set -gx EDITOR nvim
    else
        set -gx EDITOR vi
    end
    set -gx LANG en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8

    set -gx GOPATH $HOME/go
    fish_add_path $GOPATH/bin
    fish_add_path $HOME/bin
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/node_modules/.bin

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

    # `ls` — eza preferred; else BSD vs GNU defaults
    if type -q eza
        abbr --add -g ls 'eza --long --classify --all --git --tree --level 1'
    else if test (uname) = Darwin
        abbr -a -g ls ls -laG
    else
        abbr -a -g ls ls -la --color=auto
    end

    # `cat` → `bat` or nvimpager
    if type -q bat
        abbr --add -g cat bat
    else if type -q nvimpager
        abbr --add -g cat nvimpager
    end

    # `zoxide` → `z`
    if type -q zoxide
        abbr --add -g z zoxide
    end

    # `vi` → `nvim`
    if type -q nvim
        abbr --add -g vi nvim
    end

    if type -q cursor
        abbr --add -g e cursor
    end

    if type -q zed
        abbr --add -g e zed
    end

    if type -q gtar
        abbr --add -g tar gtar
    end

    if type -q claude
        abbr --add -g cc claude --dangerously-skip-permissions
    end

    if type -q lazygit
        abbr --add -g lg lazygit
    end

    abbr --add -g dc docker compose
end
