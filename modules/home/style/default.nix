{inputs,stylix, pkgs, ...}: {
  imports = [
    stylix.homeManagerModules.stylix
  ];

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
  ];

  stylix.image = pkgs.fetchurl {
   url = "https://images.hdqwalls.com/wallpapers/tengen-toppa-gurren-lagann-4k-1m.jpg";
   sha256 = "sha256-wplFIlIIYHTofJMuBLtpSWwrFyzz8ao1Gq4wGqgz7qY=";
  };

  stylix.opacity.applications = 0.3;
  stylix.opacity.terminal = 0.3;

  stylix.targets.foot.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
  stylix.polarity = "dark";

    stylix.fonts = {
    monospace = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerdfonts;
    };
    serif = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerdfonts;
    };
    sansSerif = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerdfonts;
    };
    emoji = {
      name = "Noto Color Emoji";
      package = pkgs.nerdfonts;
    };
    sizes = {
      terminal = 12;
      applications = 12;
      popups = 12;
      desktop = 12;
    };
  };



}