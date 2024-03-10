{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    wf-recorder
    glib
    direnv
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
  };
}
#

