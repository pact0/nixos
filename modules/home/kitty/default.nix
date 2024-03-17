{pkgs, ...}: {
  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      window_padding_width = 5;
      window_padding_height = 5;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;

      ## Tabs
      tab_title_template = "{index}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";

      # allow_remote_control = "yes";
      # listen_on = "unix:@kitty";
    };
  };
}
