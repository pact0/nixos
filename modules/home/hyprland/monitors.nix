{...}: {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        #monitor=,preferred,auto,auto
        #monitor=,1920x1200,auto,auto

        "HDMI-A-1,1920x1080@60,0x1080,1"
        "HDMI-A-1,transform,2"
        #workspace=HDMI-A-1,1

        "DP-1,3440x1440@75,1920x0,1"
        #workspace=DP-1,11

        "DP-2,1920x1080@60,0x0,1"
        #workspace=DP-2,1

        "DP-3,1920x1080@60,5360x0,1"
        "DP-3,transform,1"
      ];
    };
  };
}
