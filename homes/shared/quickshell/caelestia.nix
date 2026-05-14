{inputs, ...}: {
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.status = {
        showBattery = false;
      };
      paths.wallpaperDir = "~/wallpapers";

      background = {
        desktopClock = {
          enabled = true;
        };

        visualiser = {
          enabled = true;
        };
      };
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme = {
          enableTerm = false;
          enableHypr = false;
          enableDiscord = false;
          enableSpicetify = false;
          enablePandora = false;
          enableFuzzel = false;
          enableBtop = false;
          enableNvtop = false;
          enableHtop = false;
          enableGtk = false;
          enableQt = false;
          enableWarp = false;
          enableChromium = false;
          enableZed = false;
          enableCava = false;
          # theme.enableGtk = true;
        };
      };
    };
  };
}
