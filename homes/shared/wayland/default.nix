{pkgs, ...}: {
  imports = [
    ./gammastep.nix
    ./wallpaper.nix

    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./wlogout.nix
  ];

  home.packages = with pkgs; [
    grim
    slurp

    wl-clipboard
    # wl-screenrec
  ];
}
