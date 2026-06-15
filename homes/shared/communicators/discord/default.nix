{
  inputs',
  osConfig,
  pkgs,
  lib,
  ...
}: let
  # inherit (lib.modules) mkIf;
  # inherit (osConfig) modules;
  #
  # sys = modules.system;
  # prg = sys.programs;
  nixpkgsSmall = inputs'.nixpkgs-small;
  vesktopPkg = nixpkgsSmall.legacyPackages.vesktop.override {
    electron = pkgs.electron_32;
  };
in {
  config = {
    home.packages = with pkgs; [
      vesktop
      # vesktopPkg
    ];

    xdg.configFile."vesktop/settings/settings.json".source = ./settings.json;
  };
}
