{
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkForce;
  font = {
    package = pkgs.nerd-fonts.hack;
    name = "Hack";
    sizes = {
      terminal = 10;

      applications = 12;

      popups = 12;

      desktop = 12;
    };
  };
  cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };
in {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = true;

    # base16Scheme = "${pkgs.base16-schemes}/share/themes/${base16Scheme}.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";

    # image = pkgs.fetchurl {
    #   url = "https://images.hdqwalls.com/wallpapers/tengen-toppa-gurren-lagann-4k-1m.jpg";
    #   sha256 = "sha256-wplFIlIIYHTofJMuBLtpSWwrFyzz8ao1Gq4wGqgz7qY=";
    # };

    targets = {
      # targets.hyprland.enable = mkForce false;
      # hyprland.hyprpaper.enable = mkForce false;
      # hyprpaper.enable = mkForce false;
      # hyprlock.enable = mkForce false;

      # qt.platform = "gtk3"; # WARN:  qt: `config.stylix.targets.qt.platform` other than 'qtct' are currently unsupported: gtk3.
      # qt.platform = "qtct";
    };

    fonts = {
      serif = {
        inherit (font) package name;
      };
      sansSerif = {
        inherit (font) package name;
      };
      monospace = {
        inherit (font) package name;
      };

      emoji = {
        inherit (font) package;
        name = "Noto Color Emoji";
      };

      sizes = {
        inherit (font.sizes) terminal applications popups desktop;
      };
    };

    cursor = {
      inherit (cursor) package name size;
    };

    # opacity = {
    #   inherit (cfg.opacity) desktop terminal applications popups;
    # };
  };
}
