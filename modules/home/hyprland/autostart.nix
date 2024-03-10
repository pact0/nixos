{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      "exec-once" = [
        "waybar &"
        "mako &"
        "load-wallpapers"
      ];
    };
  };
}
