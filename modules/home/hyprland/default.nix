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
  ];

  home.packages = [
    inputs.hyprpaper.packages.${pkgs.system}.hyprpaper
  ];

  home.file.".config/hypr/hyprpaper.conf".text =
    ''    
      preload = ''
    + config.stylix.image
    + ''    
    
      wallpaper = DP-1,''
    + config.stylix.image
    + ''    
    
      wallpaper = HDMI-A-1,''
    + config.stylix.image
    + ''    
    
      wallpaper = DP-2,''
    + config.stylix.image
    + ''    
    
      wallpaper = DP-3,''
    + config.stylix.image
    + ''
    '';
}
