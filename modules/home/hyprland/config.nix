{...}: {
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        kb_layout = "pl,us";
        numlock_by_default = true;
        follow_mouse = "1";
        sensitivity = "0";
        accel_profile = "flat";
        force_no_accel = 1;
        touchpad = {
          natural_scroll = 1;
        };
      };
      animations = {
        enabled = "true";
        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];
        # Windows
        animation = [
          "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
          "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
          "windowsMove, 1, 2, easeinoutsine, slide"
          "fadeIn, 1, 3, easeOutCubic"
          "fadeOut, 1, 1.7, easeOutCubic"
          "fadeSwitch, 0, 1, easeOutCirc"
          "fadeShadow, 1, 10, easeOutCirc"
          "fadeDim, 1, 4, fluent_decel"
          "border, 1, 2.7, easeOutCirc"
          "borderangle, 1, 30, fluent_decel, once"
          "workspaces, 1, 3, easeOutCubic, fade # styles: slide, slidevert, fade, slidefade, slidefadevert"
        ];
      };

      general = {
        layout = "dwindle";
        gaps_in = "2";
        gaps_out = "2";
        border_size = "2";
        # get this from stylix
        #"col.active_border" = "rgb(cba6f7) rgb(94e2d5) 45deg";
        #"col.inactive_border" = "0x00000000";
        border_part_of_window = "true";
      };

      gestures = {
        workspace_swipe = "false";
      };

      decoration = {
        rounding = "5";
        # rounding = 12

        # active_opacity = "0.90";
        # inactive_opacity = "0.90";
        # fullscreen_opacity = "1.0";

        blur = {
          enabled = "true";

          size = "4";
          passes = "2";

          brightness = "1";
          contrast = "1.300000";
          ignore_opacity = "true";
          noise = "0.011700";

          new_optimizations = "true";

          xray = "true";
        };

        drop_shadow = "true";

        shadow_ignore_window = "true";
        shadow_offset = "0 2";
        shadow_range = "20";
        shadow_render_power = "3";
        # stylix
        # "col.shadow" = "rgba(00000055)";
      };

      misc = {
        disable_autoreload = "true";
        disable_hyprland_logo = "true";
        always_follow_on_dnd = "true";
        layers_hog_keyboard_focus = "true";
        animate_manual_resizes = "false";
        enable_swallow = "true";
        # swallow_regex =
        focus_on_activate = "true";
      };

      xwayland = {
        force_zero_scaling = "true";
      };

      dwindle = {
        no_gaps_when_only = "false";
        force_split = "0";
        special_scale_factor = "1.0";
        split_width_multiplier = "1.0";
        use_active_for_splits = "true";
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_is_master = "true";
        special_scale_factor = "1";
        no_gaps_when_only = "false";
      };
    };
  };
}
