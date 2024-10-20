{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      "exec-once" = [
        "waybar &"
        "mako &"
        "load-wallpapers &"
        "signal-desktop --start-in-tray &"
        "vesktop --start-minimized &"
        # "streamdeck -n &"
        "bitwarden &"
      ];

      windowrulev2 = [
        "float,class:^(signal)$"
        "minsize 1080 560,class:^(signal)$"
        "center,class:^(signal)$"
        "pin,class:^(signal)$"
        "dimaround,class:^(signal)$"

        "float,class:^(vesktop)$"
        "float,class:^(Bitwarden)$"
      ];
    };
  };
}
