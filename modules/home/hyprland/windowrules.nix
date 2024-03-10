{...}: let
in {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"
        #pgorams
        "float,class:^(pavucontrol)$"
        "float,class:^(mpv)$"
        "float,class:^(steam)$"
        "float,class:^(org.qbittorrent.qBittorrent)$"
        "float,title:^(Stream Deck UI)$"

        "opacity 1.0 1.0,class:^(wofi)$"

        "monitor DP-1,title:^(Hearthstone)$"
        "center,title:^(Hearthstone)$"
      ];
    };
  };
}
