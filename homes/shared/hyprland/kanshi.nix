{
  osConfig,
  lib,
  ...
}: let
  k = osConfig.monitors.kanshi or {};
in
  lib.mkIf k.enable {
    services.kanshi = {
      enable = true;

      settings = k.profiles;
    };
  }
