{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    (import ./hyprland.nix)
    (import ./config.nix)
    (import ./variables.nix)
    (import ./binds.nix)
    (import ./autostart.nix)
    (import ./monitors.nix)
    (import ./windowrules.nix)
    (import ./sww)
    (import ./wlogout)
    (import ./pyprland.nix)
  ];
}
