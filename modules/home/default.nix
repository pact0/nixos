{pkgs, ...}: {
  imports = [
    (import ./mako)
    (import ./packages)
    (import ./hyprland)
    (import ./vscodium)

    (import ./opt)
    (import ./core)

    (import ./shell)
    (import ./wofi)
    (import ./waybar)
    (import ./style)
    (import ./tmux)
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
