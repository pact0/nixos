{
  pkgs,
  inputs,
  config,
  ...
}: let
  colors = {
    background = "#${config.lib.stylix.colors.base00}";
    lighter_background = "#${config.lib.stylix.colors.base01}";
    selection_background = "#${config.lib.stylix.colors.base02}";
    light_background = "#${config.lib.stylix.colors.base07}";

    dark_foreground = "#${config.lib.stylix.colors.base04}";
    foreground = "#${config.lib.stylix.colors.base05}";
    light_foreground = "#${config.lib.stylix.colors.base06}";

    highlight = "#${config.lib.stylix.colors.base03}";
    variables = "#${config.lib.stylix.colors.base08}";
    atributes = "${config.lib.stylix.colors.base09}";
    search = "#${config.lib.stylix.colors.base0A}";
    diff = "#${config.lib.stylix.colors.base0B}";
    quote = "#${config.lib.stylix.colors.base0C}";
    heading = "#${config.lib.stylix.colors.base0D}";
    keyword = "#${config.lib.stylix.colors.base0E}";
    tag = "#${config.lib.stylix.colors.base0F}";
  };
in {
  programs.tmux = {
    enable = true;
    prefix = "C-Space";
    shortcut = "C-Space";
    keyMode = "vi";
    terminal = "screen-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 10000;
    plugins = with pkgs; [
      tmuxPlugins.cpu
      tmuxPlugins.sensible
      tmuxPlugins.better-mouse-mode
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '5' # minutes
        '';
      }
      {
        plugin = tmuxPlugins.yank;
        extraConfig = ''
          set -g @yank_with_mouse on
        '';
      }
      {
        plugin = tmuxPlugins.tilish;
        extraConfig = ''
          set -g @tilish-navigator 'on'
          set -g @tilish-dmenu 'on'
        '';
      }
      # {
      #   plugin = tmuxPlugins.session-wizard;
      #   extraConfig = ''
      #     set -g @session-wizard 's'
      #   '';
      # }
      {
        plugin = inputs.tmux-sessionx.packages.${pkgs.system}.default;
        extraConfig = ''
          set -g @sessionx-bind 's'
          set -g @sessionx-bind-rename-session 'alt-r'
        '';
      }
      {
        plugin = tmuxPlugins.copycat;
        extraConfig = ''

        '';
      }
      {
        plugin = tmuxPlugins.fuzzback;
        extraConfig = ''
          set -g @fuzzback-finder-bind 'ctrl-y:execute-silent(echo -n {3..} | wl-copy)+abort'
        '';
      }
      {
        plugin = tmuxPlugins.open;
        extraConfig = ''
          set -g @open-S 'https://www.duckduckgo.com/?q='
        '';
      }
    ];
    extraConfig = ''
      set-window-option -g allow-passthrough on # images in terminal
      unbind %
      unbind '"'
      bind-key v split-window -v  -c '#{pane_current_path}'
      bind-key h split-window -h  -c '#{pane_current_path}'

      bind c new-window -c "#{pane_current_path}"
      bind r source-file ~/.config/tmux/tmux.conf \; display "tmux configs reloaded"

      # kill current session
      bind-key K run-shell 'tmux switch-client -n \; kill-session -t "$(tmux display-message -p "#S")" || tmux kill-session'

      # move pane to a new session
      bind-key C-b send-keys 'tat && exit' 'C-m'

      # Coarse adjustment (5 or 10 cursor cells per bump)
      bind -n C-Left resize-pane -L 10
      bind -n C-Right resize-pane -R 10
      bind -n C-Down resize-pane -D 5
      bind -n C-Up resize-pane -U 5

      # Use vim keybindings in copy mode
      setw -g mode-keys vi

      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -select clipboard'

      # Remap the copy & paste keys to work as in vim
      unbind -T copy-mode-vi v
      unbind -T copy-mode-vi y
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi C-v send -X rectangle-toggle
      bind -T copy-mode-vi y send -X copy-selection

      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

      # Make it easier to enter copy-mode.
      # Don't be so overeager with paging.
      bind -T copy-mode-vi S-PageUp send -X halfpage-up
      bind -T copy-mode-vi S-PageDown send -X halfpage-down
      bind -T copy-mode-vi PageUp send -X halfpage-up
      bind -T copy-mode-vi PageDown send -X halfpage-down

      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      # Theme


      color_bg="${colors.background}"
      color_fg="${colors.dark_foreground}" # accent text background on the left
      color_border="${colors.background}"
      color_bg_status="${colors.lighter_background}" # bar
      color_accent_dark="${colors.lighter_background}" # name of session
      # ------------------------
      #color_green="#98c379"
      #color_yellow="#e5c07b"
      #color_red="#e06c75"
      #color_blue="#61afef"
      #color_cyan="#56b6c2"
      color_purple="#c678dd"
      #color_gray="#5c6370"
      #color_buffer="#939aa3"
      #color_selection="#3e4452"


      set -g @mode_indicator_prefix_prompt "WAIT"
      set -g @mode_indicator_prefix_mode_style fg=$color_blue,bg=$color_bg,bold
      set -g @mode_indicator_copy_prompt "COPY"
      set -g @mode_indicator_copy_mode_style fg=$color_green,bg=$color_bg,bold
      set -g @mode_indicator_sync_prompt "SYNC"
      set -g @mode_indicator_sync_mode_style fg=$color_red,bg=$color_bg,bold
      set -g @mode_indicator_empty_prompt "TMUX"
      set -g @mode_indicator_empty_mode_style fg=$color_purple,bg=$color_bg,bold

      # fonts
      set -g window-status-current-format '#[#default]#W'
      set -g window-status-format         '#[fg=$color_fg,bg=$color_bg,bold]#W'

      # ----------------------------------------------------------------------
      # | Options                                                            |
      # ----------------------------------------------------------------------

      set -g mode-style "fg=$color_fg,bg=$color_bg"
      set -g message-style "fg=$color_fg,bg=$color_bg"
      set -g message-command-style "fg=$color_fg,bg=$color_bg"
      set -g pane-border-style "fg=$color_border"
      set -g pane-active-border-style "fg=$color_fg"
      set -g status on
      set -g status-justify left
      set -g status-style "fg=$color_fg,bg=$color_bg_status"
      set -g status-left-length "100"
      set -g status-right-length "100"
      set -g status-left-style NONE
      set -g status-right-style NONE

      # ----------------------------------------------------------------------
      # | Theme                                                              |
      # ----------------------------------------------------------------------

      set -g status-left "#[fg=$color_accent_dark,bg=$color_fg,bold] #S #[fg=$color_fg,bg=$color_bg_status,nobold,nounderscore,noitalics]"
      set -g status-right "#[fg=$color_bg_status,bg=$color_bg_status,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_bg_status] #{prefix_highlight} #[fg=$color_border,bg=$color_bg_status,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_bg] %Y-%m-%d  %I:%M %p#[fg=$color_bg_status,bg=$color_bg,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_bg_status,nobold,nounderscore,noitalics]#[fg=$color_accent_dark,bg=$color_fg,bold] #h "

      setw -g window-status-activity-style "underscore,fg=${colors.dark_foreground},bg=$color_bg_status"
      setw -g window-status-separator ""
      setw -g window-status-style "NONE,fg=${colors.dark_foreground},bg=$color_bg_status"
      setw -g window-status-format "#[fg=$color_bg_status,bg=$color_bg_status,nobold,nounderscore,noitalics]#[default] #I  #W #[fg=$color_bg_status,bg=$color_bg_status,nobold,nounderscore,noitalics]"
      setw -g window-status-current-format "#[fg=$color_bg_status,bg=$color_bg,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_bg,bold] #I  #W #[fg=$color_border,bg=$color_bg_status,nobold,nounderscore,noitalics]"

    '';
  };
}
# {
#   inputs,
#   pkgs,
#   ...
# }: {
#   home.packages = with pkgs; [
#     # https://github.com/edr3x/tmux-sessionizer?tab=readme-ov-file#tmux-sessionizer
#     tmux-sessionizer
#     # Script to find files with tmux in vim
#     (writeShellScriptBin "tmux-sessionizer-script" ''
#           if [[ $# -eq 1 ]]; then
#           selected=$1
#       else
#           selected=$(find ~/projects ~/tests -mindepth 1 -maxdepth 1 -type d | fzf)
#       fi
#       if [[ -z $selected ]]; then
#           exit 0
#       fi
#       selected_name=$(basename "$selected" | tr . _)
#       tmux_running=$(pgrep tmux)
#       if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
#           tmux new-session -s $selected_name -c $selected
#           exit 0
#       fi
#       if ! tmux has-session -t=$selected_name 2> /dev/null; then
#           tmux new-session -ds $selected_name -c $selected
#       fi
#       if [[ -z $TMUX ]]; then
#           tmux attach -t $selected_name
#       else
#           tmux switch-client -t $selected_name
#       fi
#     '')
#   ];
#   programs.tmux = {
#     enable = true;
#     clock24 = true;
#     baseIndex = 1;
#     terminal = "xterm-256color";
#     escapeTime = 0;
#     keyMode = "vi";
#     prefix = "C-Space";
#     mouse = true;
#     plugins = with pkgs.tmuxPlugins; [
#       # catppuccin
#       yank
#       sensible
#       tmux-fzf
#       vim-tmux-navigator
#     ];
#     extraConfig = ''
#       #--------------------------------------------------------------------------
#       # Keybinds
#       #--------------------------------------------------------------------------
#       # Shift Alt vim keys to switch windows
#       bind -n M-H previous-window
#       bind -n M-L next-window
#       # Open panes in current directory
#       bind '"' split-window -v -c "#{pane_current_path}"
#       bind % split-window -h -c "#{pane_current_path}"
#       # Copy mode
#       bind-key -T copy-mode-vi v send-keys -X begin-selection
#       bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
#       bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
#       # Don't exit from tmux when closing a session
#       set -g detach-on-destroy off
#       # Renumber all windows when any window is closed
#       set -g renumber-windows on
#       # Place status bar on top
#       set -g status-position top
#       # Sessionx plugin
#       set -g @sessionx-bind '<prefix>+O'
#       set -g @sessionx-x-path '~/nixdots'
#       set -g @sessionx-filter-current 'false'
#       set -g @sessionx-preview-enabled 'true'
#       set -g @sessionx-window-height '95%'
#       set -g @sessionx-window-width '75%'
#       set -g @sessionx-zoxide-mode 'on'
#       # Tmux sessionizer
#       # forget the find window.  That is for chumps
#       bind-key -r f run-shell "tmux neww tmux-sessionizer-script"
#       #--------------------------------------------------------------------------
#       # Status line
#       #--------------------------------------------------------------------------
#       # Enable catppuccin theme
#       # set -g @catppuccin_flavour 'mocha'
#       # Enable transparent tmux bar
#       # set -g status-bg default
#       # set -g status-style bg=default
#       # Status line customisation
#       set-option -g status-left-length 100
#       set-option -g status-right-length 100
#       set-option -g status-left " #{session_name}  "
#       set-option -g status-right " "
#       set-option -g status-style "fg=#828bb1 bg=default" # default will set the background to transparent
#       set-option -g window-status-format "#{window_index}:#{window_name}#{window_flags} " # window_name -> pane_current_command
#       set-option -g window-status-current-format "#{window_index}:#{window_name}#{window_flags} "
#       set-option -g window-status-current-style "fg=#B4BEFE"
#       set-option -g window-status-activity-style none
#       # clock mode
#       # setw -g clock-mode-colour colour1
#       # copy mode
#       # setw -g mode-style "fg=colour1 bg=colour18 bold"
#       # pane borders
#       set -g pane-border-style "fg=colour1"
#       set -g pane-active-border-style "fg=colour3"
#       # statusbar
#       # set -g status-justify left
#       # set -g status-style "fg=colour1"
#       # set -g status-left ""
#       # set -g status-right "%Y-%m-%d %H:%M "
#       # set -g status-right-length 50
#       # set -g status-left-length 10
#       #
#       # setw -g window-status-current-style "fg=colour0 bg=colour1 bold"
#       # setw -g window-status-current-format " #I #W #F "
#       #
#       # setw -g window-status-style "fg=colour1 dim"
#       # setw -g window-status-format " #I #[fg=colour7]#W #[fg=colour1]#F "
#       #
#       # setw -g window-status-bell-style "fg=colour2 bg=colour1 bold"
#       #
#       # # messages
#       # set -g message-style "fg=colour2 bg=colour0 bold"
#       # Biscuit
#       # set-option -g status-left-length 0
#       # set-option -g status-right-length 0
#       # set -g status-position bottom
#       # set -g status-justify centre
#       # set -g status-left "#[bg=#171717, fg=#8e8aa9]   #[bg=#171717, fg=#a38c8c]#{session_name} #[fg=#151515]█#[fg=#131313]█#[fg=#111111]█"
#       # set -g window-status-format "#[bg=#171717, fg=#736363] #I:#W "
#       # set -g window-status-current-format "#[bg=#171717, fg=#8e8aa9] #I·#W "
#       # set -g status-right "#[fg=#111111]█#[fg=#131313]█#[fg=#151515]█#[bg=#171717, fg=#a38c8c] %H:%M #[bg=#171717, fg=#8e8aa9]  "
#       # set -g window-status-activity-style none
#       # Tokyonight
#       # # ----- Messages -----
#       # set-option -g mode-style 'bg=blue, fg=black'
#       # set-option -g message-style 'bg=blue, fg=black'
#       #
#       # # ----- Center -----
#       # set-option -g status-justify centre
#       # set-option -g status-style "bg=black"
#       # set-window-option -g window-status-current-format '#[bold]#[fg=blue, bg=black]#[fg=black, bg=blue]#I:#W#[fg=blue, bg=black]'
#       # set-window-option -g window-status-format '#I:#W'
#       # set-window-option -g window-status-separator ' '
#       # set-window-option -g window-status-style "bg=black"
#       # set-window-option -g window-status-current-style "bg=blue,fg=black"
#       # # ----- Left -----
#       # set-option -g status-left " #S #[fg=blue, bg=black]"
#       # set-option -g status-left-style "bg=blue,fg=black"
#       #
#       #
#       # # ----- Right -----
#       # set-option -g status-right "#[fg=blue, bg=black] #[fg=black, bg=blue] %d/%m  %R "
#       # set-option -g status-right-style "bg=black,fg=blue"
#       # Nord
#       #+--- tmux-prefix-highlight ---+
#       # set -g @prefix_highlight_output_prefix "#[fg=brightcyan]#[bg=black]#[nobold]#[noitalics]#[nounderscore]#[bg=brightcyan]#[fg=black]"
#       # set -g @prefix_highlight_output_suffix ""
#       # set -g @prefix_highlight_copy_mode_attr "fg=brightcyan,bg=black,bold"
#       #+--------+
#       #+ Status +
#       #+--------+
#       #+--- Bars ---+
#       # set -g status-left "#[fg=brightblack,bg=black]#[fg=white,bg=brightblack,bold] #S #[fg=brightblack,bg=black,nobold,noitalics,nounderscore]"
#       # set -g status-right "#{prefix_highlight}#[fg=brightblack,bg=black,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack,nobold] #H #[fg=brightblack,bg=black,nobold]"
#       #+--- Windows ---+
#       # set -g window-status-format "#[fg=brightblack,bg=black,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] #I#[fg=white,bg=brightblack,nobold,noitalics,nounderscore]: #W #[fg=brightblack,bg=black,nobold,noitalics,nounderscore]"
#       # set -g window-status-current-format "#[fg=#5e81ac,bg=black]#[fg=white,bg=#5e81ac,bold,noitalics,nounderscore] #I#[fg=white,bg=#5e81ac,bold,noitalics,nounderscore]: #W #[fg=#5e81ac,bg=black,nobold,noitalics,nounderscore]"
#       # set -g window-status-separator " "
#       # Center the window list (yes, this value has to be written as "centre").
#       # set -g status-justify centre
#       #+----------------+
#       #+    Windows     +
#       #+----------------+
#       #+--- Bars ---+
#       # set -g pane-active-border-style "bg=default fg=blue"
#     '';
#   };
# }

