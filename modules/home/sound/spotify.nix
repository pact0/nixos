{
  inputs,
  nix-colors,
  config,
  pkgs,
  ...
}: let
  inherit (inputs) spicetify-nix;
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;

  colors = {
    base00 = "${config.lib.stylix.colors.base00}";
    base01 = "${config.lib.stylix.colors.base01}";
    base02 = "${config.lib.stylix.colors.base02}";
    base03 = "${config.lib.stylix.colors.base03}";

    base04 = "${config.lib.stylix.colors.base04}";
    base05 = "${config.lib.stylix.colors.base05}";
    base06 = "${config.lib.stylix.colors.base06}";

    base07 = "${config.lib.stylix.colors.base07}";

    base08 = "${config.lib.stylix.colors.base08}";
    base09 = "${config.lib.stylix.colors.base09}";
    base0A = "${config.lib.stylix.colors.base0A}";
    base0B = "${config.lib.stylix.colors.base0B}";
    base0C = "${config.lib.stylix.colors.base0C}";
    base0D = "${config.lib.stylix.colors.base0D}";
    base0E = "${config.lib.stylix.colors.base0E}";
    base0F = "${config.lib.stylix.colors.base0F}";
  };
in {
  imports = [inputs.spicetify-nix.homeManagerModule];
  programs.spicetify = let
  in {
    enable = true;
    theme = spicePkgs.themes.Sleek;
    # colorScheme = "mocha";
    colorScheme = "custom";

    # customColorScheme = { # catpuccin
    #   text = "ebbcba";
    #   subtext = "F0F0F0";
    #   sidebar-text = "e0def4";
    #   main = "191724";
    #   sidebar = "2a2837";
    #   player = "191724";
    #   card = "191724";
    #   shadow = "1f1d2e";
    #   selected-row = "797979";
    #   button = "31748f";
    #   button-active = "31748f";
    #   button-disabled = "555169";
    #   tab-active = "ebbcba";
    #   notification = "1db954";
    #   notification-error = "eb6f92";
    #   misc = "6e6a86";
    # };

    # ; Description
    # ; text             = main text, playlist names in main field, name of playlist selected in sidebar, headings
    # ; subtext          = text in main buttons in sidebar, playlist names in sidebar, artist names, and mini infos
    # ; nav-active-text  = text in main buttons in sidebar when active
    # ; main             = main bg
    # ; main-secondary   = bg color of selected song rows, bg color of artist/track cards
    # ; sidebar          = sidebar bg
    # ; player           = player bg
    # ; card             = popup-card bg
    # ; shadow           = all shadows
    # ; button           = playlist buttons bg in sidebar, drop-down menus, now playing song, like button
    # ; button-secondary = download and options button
    # ; button-active    = hover on song selected
    # ; button-disabled  = seekbar bg, volume bar bg, scrollbar
    # ; nav-active       = sidebar buttons bg
    # ; play-button      = color of main play button in main field
    # ; tab-active       = button bg in main field (playlists, podcasts, artists, albums)
    # ; notification     = notification ('Added to liked songs' etc.)
    # ; playback-bar     = seekbar fg, volume bar fg, main play/pause button
    # ; misc             = miscellaneous

    # customColorScheme = { # coral
    # text               = "f88379";
    # subtext            = "d7d7d7";
    # nav-active-text    = "131c26";
    # main               = "131c26";
    # sidebar            = "131c26";
    # player             = "131c26";
    # card               = "131c26";
    # shadow             = "0e0e13";
    # main-secondary     = "09111b";
    # button             = "f88379";
    # button-secondary   = "f88379";
    # button-active      = "fb958b";
    # button-disabled    = "192531";
    # nav-active         = "fb958b";
    # play-button        = "f88379";
    # tab-active         = "09111b";
    # notification       = "192531";
    # notification-error = "192531";
    # playback-bar       = "f88379";
    # misc               = "FFFFFF";
    # };

    customColorScheme = {
      text = "${colors.base05}";
      subtext = "${colors.base04}";
      nav-active-text = "${colors.base00}";
      main = "${colors.base00}";
      sidebar = "${colors.base00}";
      player = "${colors.base00}";
      card = "${colors.base00}";
      shadow = "${colors.base01}";
      main-secondary = "${colors.base02}";
      button = "${colors.base05}";
      button-secondary = "${colors.base05}";
      button-active = "${colors.base0C}";
      button-disabled = "${colors.base0F}";
      nav-active = "${colors.base0C}";
      play-button = "${colors.base05}";
      tab-active = "${colors.base02}";
      notification = "${colors.base0F}";
      notification-error = "${colors.base0F}";
      playback-bar = "${colors.base05}";
      misc = "FFFFFF";
    };

    enabledExtensions = with spicePkgs.extensions; [
      # playlistIcons
      #genre
      # historyShortcut
      # spicetify-nix.packages.${pkgs.system}.default.extensions.adblock
      # hidePodcasts
      fullAppDisplay
      showQueueDuration
      # shuffle
      # songStats
    ];
  };
}
