{
  inputs',
  pkgs,
  ...
}: {
  imports = [
    ./browsers

    ./zathura.nix
    ./obsidian.nix
    ./office.nix

    ./thunar.nix
    ./streamdeck.nix
  ];

  home.packages = with pkgs; [
    easyeffects
    qbittorrent

    bitwarden-desktop

    anki

    # gnome packages
    # gnome-tweaks
    # gnome-calendar
    komikku
  ];
}
