{
  programs.kitty = {
    enable = true;

    settings = {
      scrollback_lines = 10000;
      placement_strategy = "center";

      allow_remote_control = "yes";
      enable_audio_bell = "no";
      visual_bell_duration = "0.1";

      copy_on_select = "clipboard";

      selection_foreground = "none";
      selection_background = "none";

      # # colors
      # background_opacity = "0.9";
      #
      # font_family = "monospace";
      # # font_size = 14;
      # disable_ligatures = "never";
      # # cursor_shape = "underline";
      # cursor_blink_interval = "0.5";
      # cursor_stop_blinking_after = "15.0";
      # scrollback_lines = 10000;
      # click_interval = "0.5";
      # select_by_word_characters = ":@-./_~?&=%+#";
      # remember_window_size = false;
      # allow_remote_control = true;
      # initial_window_width = 640;
      # initial_window_height = 400;
      # repaint_delay = 15;
      # input_delay = 3;
      # visual_bell_duration = "0.0";
      # url_style = "double";
      # open_url_with = "default";
      # confirm_os_window_close = 0;
      # enable_audio_bell = false;
      # window_padding_width = 5;
      # mouse_hide_wait = 60;
    };
  };
}
