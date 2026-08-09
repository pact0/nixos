{
  wayland.windowManager.hyprland.settings = {
    config = {
      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 1;

        allow_tearing = true;
        resize_on_border = true;
      };

      decoration = {
        rounding = 10;
        rounding_power = 2.5;
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.01;

          vibrancy = 0.2;
          vibrancy_darkness = 0.5;

          passes = 4;
          size = 7;

          popups = true;
          popups_ignorealpha = 0.2;
        };

        shadow = {
          enabled = true;
          offset = "0 15";
          range = 100;
          render_power = 2;
          scale = 0.97;
        };
      };

      animations.enabled = true;

      group = {
        groupbar = {
          font_size = 10;
          gradients = false;
        };
      };
    };

    animation = [
      {
        leaf = "border";
        enabled = true;
        speed = 2;
        bezier = "default";
      }
      {
        leaf = "fade";
        enabled = true;
        speed = 4;
        bezier = "default";
      }
      {
        leaf = "windows";
        enabled = true;
        speed = 3;
        bezier = "default";
        style = "popin 80%";
      }
      {
        leaf = "workspaces";
        enabled = true;
        speed = 2;
        bezier = "default";
        style = "slide";
      }
    ];
  };
}
