{
  services.kanshi = {
    enable = true;
    # systemdTarget = "hyprland-session.target";

    profiles = {
      # undocked = {
      #   outputs = [
      #     {
      #       criteria = "eDP-1";
      #       scale = 1.1;
      #       status = "enable";
      #     }
      #   ];
      # };

      main = {
        outputs = [
          {
            criteria = "LG Electronics LG HDR WQHD 0x000A9219";
            position = "1920,0";
            mode = "3440x1440@75.05Hz";
          }
          {
            criteria = "BNQ ZOWIE XL LCD 47G00713SL0";
            position = "0,0";
            mode = "1920x1080@60Hz";
          }
        ];
      };
    };
  };
}
