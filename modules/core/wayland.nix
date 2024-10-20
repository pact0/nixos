{
  inputs,
  pkgs,
  ...
}: {
  programs = {
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    xdgOpenUsePortal = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      #pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
      #pkgs.xdg-desktop-portal-gtk
      #pkgs.xdg-desktop-portal-wlr
    ];
  };
}
