{inputs', ...}: {
  imports = [
    ./binds.nix
    ./settings.nix
    ./input.nix
    ./exec-once.nix
    ./decorations.nix
    ./smartgaps.nix
    ./rules.nix
    ./plugins.nix
    ./kanshi.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    configType = "lua";

    package = inputs'.hyprland.packages.hyprland;
    portalPackage = inputs'.hyprland.packages.xdg-desktop-portal-hyprland;
  };
}
