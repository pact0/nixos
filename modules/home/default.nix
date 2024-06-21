{
  pkgs,
  inputs,
  colors,
  ...
}: {

  imports = [
    (import ./git)
    (import ./nvim)
    (import ./kitty)
    (import ./sound)
    (import ./mpv)
    (import ./mako)
    (import ./packages)
    (import ./hyprland)
    (import ./discord)
    (import ./zathura)
    (import ./obs)
    (import ./vscodium)
    (import ./browsers)

    (import ./shell)
    (import ./wofi)
    (import ./waybar)
    (import ./style)
    (import ./tmux)

    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.packages = with pkgs; [
    ## Utils
    gamemode
    gamescope
    winetricks
    inputs.nix-gaming.packages.${pkgs.system}.proton-ge
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
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
    cura
    # inputs.nixvim.packages.${pkgs.system}.default
  ];

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = ["zathura"];
      "video/mp4" = ["mpv.desktop"];
      "image/png" = ["imv"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
      "inode/directory" = "nvim";
    };
    defaultApplications = {
      "application/pdf" = ["zathura"];
      "application/x-extension-htm" = ["firefox.desktop"];
      "application/x-extension-html" = ["firefox.desktop"];
      "application/x-extension-shtml" = ["firefox.desktop"];
      "application/x-extension-xht" = ["firefox.desktop"];
      "application/x-extension-xhtml" = ["firefox.desktop"];
      "application/x-www-browser" = ["firefox.desktop"];
      "application/xhtml+xml" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
      "x-scheme-handler/chrome" = ["firefox.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "x-scheme-handler/ftp" = ["firefox.desktop"];
      "x-scheme-handler/about" = ["firefox.desktop"];
      "x-scheme-handler/unknown" = ["firefox.desktop"];
      "x-scheme-handler/webcal" = ["firefox.desktop"];
      "x-www-browser" = ["firefox.desktop"];
      "video/mp4" = ["mpv.desktop"];
      "image/png" = ["imv"];
      "inode/directory" = "nvim";
    };
  };

  services.gammastep = {
    enable = true;
    tray = true;
    provider = "manual";
    latitude = 51.9194;
    longitude = 19.1451;
  };
}
