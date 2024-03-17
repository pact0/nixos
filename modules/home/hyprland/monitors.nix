{...}: {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        #monitor=,preferred,auto,auto
        #monitor=,1920x1200,auto,auto

        "HDMI-A-1,1920x1080@60,0x1080,1"
        "HDMI-A-1,transform,2"

        "DP-1,3440x1440@75,1920x0,1"

        "DP-2,1920x1080@60,0x0,1"

        "DP-3,1920x1080@60,5360x0,1"
        "DP-3,transform,1"
      ];
      workspace = [
        "1,monitor:DP-1,default:true,on-created-empty: firefox"
        "2,monitor:DP-1,on-created-empty:kitty -- tat"
        "3,monitor:DP-1"
        "4,monitor:DP-1"
        "5,monitor:DP-1"
        "6,monitor:DP-1"

        "8,monitor:DP-2"
        "9,monitor:DP-3"
        "0,monitor:DP-HDMI-A-1"
      ];
    };
  };
}
