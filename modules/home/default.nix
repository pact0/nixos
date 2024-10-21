{pkgs, ...}: {
  imports = [
    (import ./mako)
    (import ./packages)
    (import ./hyprland)
    (import ./vscodium)

    (import ./opt)
    (import ./core)

    (import ./wofi)
    (import ./style)
  ];

  home.packages = with pkgs; [
    ## Utils
    gamemode
    gamescope
    winetricks
    brave

    supabase-cli
    qmk
    insomnia
    ## Doom
    crispy-doom
    vesktop
    discord

    bitwarden
    qbittorrent

    fluxcd
    bottles
    # cura
  ];
}
