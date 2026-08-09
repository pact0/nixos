{lib, ...}: {
  wayland.windowManager.hyprland.settings.on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("sleep 10 && bitwarden")
          hl.exec_cmd("sleep 10 && signal-desktop --start-in-tray")
          hl.exec_cmd("sleep 10 && vesktop --start-minimized")
          hl.exec_cmd("sleep 10 && spotify")
          hl.exec_cmd("sleep 10 && vicinae server")
          -- hl.exec_cmd("waypaper --restore")
          hl.exec_cmd("kitty")
        end
      '')
    ];
  };
}
