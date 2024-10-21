{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.opt.services.kanshi;
in {
  options.opt.services.kanshi.enable = mkEnableOption "kanshi";

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [kanshi];
    };
    services.kanshi = {
      enable = true;
      systemdTarget = "hyprland-session.target";
      settings = [
        {
          profile.name = "home";
          profile.outputs = [
            {
              criteria = "eDP-1";
              status = "disable";
            }
            {
              criteria = "Philips Consumer Electronics Company 247ELH AU01243009967";
              mode = "1920x1080";
              position = "2560,0";
            }
            {
              criteria = "XMI Mi Monitor 3342300023271";
              mode = "2560x1440@60";
              position = "0,0";
            }
          ];
        }
      ];
    };
  };
}
