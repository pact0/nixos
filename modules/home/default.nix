{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    (import ./bat)
    (import ./btop)
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
  ];

  home.packages = with pkgs; [
    ## Utils
    gamemode
    gamescope
    winetricks
    inputs.nix-gaming.packages.${pkgs.system}.proton-ge
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge

    ## Doom
    crispy-doom
  ];

  xdg.mimeApps = {
    enable = true;
    # associations.added = {
    #   "application/pdf" = ["firefox.desktop" "brave-browser.desktop" "zathura"];
    #   "image/png" = [
    #     "sxiv.desktop"
    #     "gimp.desktop"
    #   ];

    #   "inode/directory" = "ranger.desktop";
    # };
    # defaultApplications = {
    #   "application/pdf" = ["firefox.desktop"];
    #   "image/png" = [
    #     "sxiv.desktop"
    #     "gimp.desktop"
    #   ];

    #   "text/html" = "firefox.desktop";
    #   "x-scheme-handler/http" = "firefox.desktop";
    #   "x-scheme-handler/https" = "firefox.desktop";
    #   "x-scheme-handler/about" = "firefox.desktop";
    #   "x-scheme-handler/unknown" = "firefox.desktop";
    # };
  };

  #   xdg.mimeApps = {
  #     enable = true;
  #     associations.added = {
  #       "application/pdf" = ["firefox.desktop"];
  #       "video/mp4" = ["mpv.desktop"];
  #       "x-scheme-handler/http" = ["firefox.desktop"];
  #       "x-scheme-handler/https" = ["firefox.desktop"];
  #       "text/html" = ["firefox.desktop"];
  #     };
  #     defaultApplications = {
  #       "application/pdf" = ["firefox.desktop"];
  #       "application/x-extension-htm" = ["firefox.desktop"];
  #       "application/x-extension-html" = ["firefox.desktop"];
  #       "application/x-extension-shtml" = ["firefox.desktop"];
  #       "application/x-extension-xht" = ["firefox.desktop"];
  #       "application/x-extension-xhtml" = ["firefox.desktop"];
  #       "application/x-www-browser" = ["firefox.desktop"];
  #       "application/xhtml+xml" = ["firefox.desktop"];
  #       "text/html" = ["firefox.desktop"];
  #       "x-scheme-handler/chrome" = ["firefox.desktop"];
  #       "x-scheme-handler/http" = ["firefox.desktop"];
  #       "x-scheme-handler/https" = ["firefox.desktop"];
  #       "x-scheme-handler/ftp" = ["firefox.desktop"];
  #       "x-scheme-handler/about" = ["firefox.desktop"];
  #       "x-scheme-handler/unknown" = ["firefox.desktop"];
  #       "x-scheme-handler/webcal" = ["firefox.desktop"];
  #       "x-www-browser" = ["firefox.desktop"];
  #       "video/mp4" = ["mpv.desktop"];
  #     };
  #   };
}
