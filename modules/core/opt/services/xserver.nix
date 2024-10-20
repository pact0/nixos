{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.opt.services.xserver;
  username = "pacto";
in {
  options.opt.services.xserver.enable = mkEnableOption "xserver";
  config = mkIf cfg.enable {
    services = {
      libinput = {
        enable = true;
        touchpad = {
          tapping = true;
          middleEmulation = true;
          naturalScrolling = true;
        };
      };
      xserver = {
        enable = true;
        xkb.layout = "pl";
        # xkb.options = "compose:rctrl,caps:escape";

        # videoDrivers = ["amdgpu"];
        videoDrivers = ["nvidia"];

        updateDbusEnvironment = true;
        desktopManager.gnome.enable = false;
      };
      displayManager = {
        autoLogin = {
          enable = true;
          user = "${username}";
        };
        defaultSession = "none+hyprland";
      };
    };
  };
}
