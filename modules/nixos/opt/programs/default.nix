{pkgs, ...}: {
  imports = [
    ./steam.nix
    ./lutris.nix
    ./streamdeck.nix
  ];

  services.gvfs.enable = true;
  services.tumbler.enable = true;

  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
    thunar-media-tags-plugin
  ];
}
