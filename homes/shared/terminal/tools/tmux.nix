{
  pkgs,
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
    attributes = "${config.lib.stylix.colors.base09}";
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
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 10000;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank
      tmuxPlugins.fuzzback
      tmuxPlugins.resurrect
      tmuxPlugins.tmux-floax

      {
        plugin = tmuxPlugins.tmux-thumbs;
        extraConfig = ''
          set -g @thumbs-command 'echo -n {} | wl-copy'
        '';
      }

      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
        '';
      }

      {
        plugin = tmuxPlugins.tilish;
        extraConfig = ''
          set -g @tilish-navigator 'on'
          set -g @tilish-dmenu 'on'
        '';
      }
    ];

    extraConfig = ''
      bind r source-file ~/.config/tmux/tmux.conf \;

      bind-key x kill-pane # skip "kill-pane 1? (y/n)" prompt
      set -g detach-on-destroy off  # don't exit from tmux when closing a session

      unbind %
      unbind '"'
      bind-key v split-window -v  -c '#{pane_current_path}'
      bind-key h split-window -h  -c '#{pane_current_path}'

      bind c new-window -c "#{pane_current_path}"

      unbind -T copy-mode-vi v
      unbind -T copy-mode-vi y
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi C-v send -X rectangle-toggle
      bind -T copy-mode-vi y send -X copy-selection

      # coarse adjustment
      bind -n C-Left resize-pane -L 10
      bind -n C-Right resize-pane -R 10
      bind -n C-Down resize-pane -D 5
      bind -n C-Up resize-pane -U 5

      bind -N "last-session (via sesh) " L run-shell "sesh last"

      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      # Theme
      set -g status-position top

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
      set -g status-right "#[fg=$color_bg_status,bg=$color_bg_status,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_bg_status] #{prefix_highlight} #[fg=$color_border,bg=$color_bg_status,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_bg] %Y-%m-%d  %H:%M#[fg=$color_bg_status,bg=$color_bg,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_bg_status,nobold,nounderscore,noitalics]#[fg=$color_accent_dark,bg=$color_fg,bold] #h "

      setw -g window-status-activity-style "underscore,fg=${colors.dark_foreground},bg=$color_bg_status"
      setw -g window-status-separator ""
      setw -g window-status-style "NONE,fg=${colors.dark_foreground},bg=$color_bg_status"
      setw -g window-status-format "#[fg=$color_bg_status,bg=$color_bg_status,nobold,nounderscore,noitalics]#[default] #I  #W #[fg=$color_bg_status,bg=$color_bg_status,nobold,nounderscore,noitalics]"
      setw -g window-status-current-format "#[fg=$color_bg_status,bg=$color_bg,nobold,nounderscore,noitalics]#[fg=$color_fg,bg=$color_bg,bold] #I  #W #[fg=$color_border,bg=$color_bg_status,nobold,nounderscore,noitalics]"
    '';

    tmuxinator = {
      enable = true;
      projects = {
        myproject = {
          root = "~/nixos";
          windows = [
            {
              editor = {
                layout = "main-vertical";
                panes = [
                  {editor = ["vim"];}
                  "guard"
                ];
              };
            }
            {server = "bundle exec rails s";}
            {logs = "tail -f log/development.log";}
          ];
        };
      };
    };
  };
}
