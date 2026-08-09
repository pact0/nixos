{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    # touchpad gestures
    config.gestures = {
      workspace_swipe_forever = true;
    };

    gesture = [
      {
        fingers = 3;
        direction = "horizontal";
        action = "workspace";
      }
      {
        fingers = 4;
        direction = "left";
        action = lib.generators.mkLuaInline ''
          function()
            hl.dispatch(hl.dsp.window.move({ monitor = "-1" }))
          end
        '';
      }
      {
        fingers = 4;
        direction = "right";
        action = lib.generators.mkLuaInline ''
          function()
            hl.dispatch(hl.dsp.window.move({ monitor = "+1" }))
          end
        '';
      }
      {
        fingers = 4;
        direction = "pinch";
        action = "fullscreen";
      }
    ];
  };
}
