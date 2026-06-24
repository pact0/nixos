{pkgs, ...}: {
  imports = [
    ./browsers

    ./zathura.nix
    ./obsidian.nix
    ./office.nix

    ./thunar.nix
    ./streamdeck.nix

    ./koreader.nix
  ];

  home.packages = with pkgs; [
    easyeffects
    qbittorrent
    deluge
    bitwarden-desktop

    anki

    # gnome packages
    # gnome-tweaks
    # gnome-calendar
    komikku
  ];
}
