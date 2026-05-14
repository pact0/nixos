{
  inputs',
  inputs,
  pkgs,
  ...
}: let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  programs.hyprland = {
    enable = true;
    package = inputs'.hyprland.packages.hyprland;
    portalPackage = inputs'.hyprland.packages.xdg-desktop-portal-hyprland;

    withUWSM = true;
  };

  # <https://wiki.hypr.land/Useful-Utilities/Systemd-start/#uwsm>
  # If you use the Home Manager module, make sure to disable the systemd integration, as it conflicts with uwsm.
  # wayland.windowManager.hyprland.systemd.enable = false;

  hardware.graphics = {
    enable = true;

    # if you also want 32-bit support (e.g for Steam)
    enable32Bit = true;
  };

  environment.variables.NIXOS_OZONE_WL = "1";
}
