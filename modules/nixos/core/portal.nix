{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    # xdgOpenUsePortal = true;
    wlr.enable = false;
    xdgOpenUsePortal = false;
    config = {
      common.default = ["hyprland"];
      hyprland.default = ["hyprland"];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };
}
