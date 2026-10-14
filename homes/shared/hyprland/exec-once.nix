{lib, ...}: {
  wayland.windowManager.hyprland.settings.on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          -- Launch vesktop after tray is ready
          hl.exec_cmd("sleep 10 && vesktop --start-minimized")
          hl.exec_cmd("signal-desktop --start-in-tray")
          hl.exec_cmd("spotify")
          hl.exec_cmd("kitty")
        end
      '')
    ];
  };
}
