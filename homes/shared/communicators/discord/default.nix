{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [
      vesktop
      # vesktopPkg
    ];

    xdg.configFile."vesktop/settings/settings.json".source = ./settings.json;
  };
}
