{
  inputs,
  stylix,
  pkgs,
  theme,
  ...
}: let
  font = "FiraCode Nerd Font";
in {
  imports = [
    stylix.homeManagerModules.stylix
  ];

  home.packages = [
    (pkgs.nerdfonts.override {fonts = ["FiraCode" "DroidSansMono" "JetBrainsMono" "Iosevka" "Hack"];})
  ];
  stylix = {
    image = pkgs.fetchurl {
      url = "https://images.hdqwalls.com/wallpapers/tengen-toppa-gurren-lagann-4k-1m.jpg";
      sha256 = "sha256-wplFIlIIYHTofJMuBLtpSWwrFyzz8ao1Gq4wGqgz7qY=";
    };
    opacity = {
      applications = 0.8;
      desktop = 0.8;

      terminal = 0.7;
    };

    autoEnable = true;
    enable = true;

    targets.nixvim.transparent_bg.main = false;
    targets.nixvim.transparent_bg.sign_column = false;

    # https://github.com/tinted-theming/base16-schemes
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
    polarity = "dark";

    fonts = {
      monospace = {
        name = "${font}";
        package = pkgs.nerdfonts;
      };
      serif = {
        name = "${font}";
        package = pkgs.nerdfonts;
      };
      sansSerif = {
        name = "${font}";
        package = pkgs.nerdfonts;
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.nerdfonts;
      };
      sizes = {
        terminal = 10;
        applications = 12;
        popups = 12;
        desktop = 12;
      };
    };
  };
}
