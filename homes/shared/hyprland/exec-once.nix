{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "sleep 10 && bitwarden"
      "sleep 10 && signal-desktop --start-in-tray"
      "sleep 10 && vesktop --start-minimized"
      "sleep 10 && spotify"
      "sleep 10 && vicinae server"
      # "waypaper --restore"
      "kitty"
    ];
  };
}
