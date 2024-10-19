{
  inputs,
  nix-colors,
  config,
  pkgs,
  ...
}: let
  inherit (inputs) spicetify;
  spicePkgs = inputs.spicetify.legacyPackages.${pkgs.system};

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
  imports = [spicetify.homeManagerModules.default];

  programs.spicetify = {
    enable = true;
    # theme = spicePkgs.themes.sleek;
    # colorScheme = "custom";
    # customColorScheme = {
    #   text = "${colors.base05}";
    #   subtext = "${colors.base04}";
    #   nav-active-text = "${colors.base00}";
    #   main = "${colors.base00}";
    #   sidebar = "${colors.base00}";
    #   player = "${colors.base00}";
    #   card = "${colors.base00}";
    #   shadow = "${colors.base01}";
    #   main-secondary = "${colors.base02}";
    #   button = "${colors.base05}";
    #   button-secondary = "${colors.base05}";
    #   button-active = "${colors.base0C}";
    #   button-disabled = "${colors.base0F}";
    #   nav-active = "${colors.base0C}";
    #   play-button = "${colors.base05}";
    #   tab-active = "${colors.base02}";
    #   notification = "${colors.base0F}";
    #   notification-error = "${colors.base0F}";
    #   playback-bar = "${colors.base05}";
    #   misc = "FFFFFF";
    # };
    enabledExtensions = with spicePkgs.extensions; [
      # playlistIcons
      #genre
      # historyShortcut
      # spicetify-nix.packages.${pkgs.system}.default.extensions.adblock
      # hidePodcasts
      fullAppDisplay
      showQueueDuration
      fullAlbumDate
      wikify
      # shuffle
      # songStats
    ];
  };
}
