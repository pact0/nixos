{
  wayland.windowManager.hyprland.settings = {
    input = {
      # keyboard layout
      kb_layout = "pl,us";
      # self explanatory, I hope?
      follow_mouse = 1;
      # do not imitate natural scroll
      touchpad.natural_scroll = "no";
      # ez numlock enable
      numlock_by_default = true;

      accel_profile = "flat";
      force_no_accel = true;
      focus_on_close = 1;

      tablet.output = "current";
    };
    cursor = {
      no_hardware_cursors = true;
    };

    # touchpad gestures
    gestures = {
      workspace_swipe_forever = true;
    };

    gesture = [
      "3, horizontal, workspace"
      "4, left, dispatcher, movewindow, mon:-1"
      "4, right, dispatcher, movewindow, mon:+1"
      "4, pinch, fullscreen"
    ];
  };
}
