{
  pkgs,
  lib,
  config,
  ...
}: {
  # greetd display manager with a terminal (tuigreet) login screen
  services.greetd = let
    sessionCmd = "${lib.getExe config.programs.uwsm.package} start hyprland-uwsm.desktop";
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = {
        command =
          "${lib.getExe pkgs.tuigreet} --time --remember --asterisks --cmd "
          + lib.escapeShellArg sessionCmd;
        user = "greeter";
      };
    };
  };

  # dedicated unprivileged user the greeter runs as
  users.groups.greeter = {};
  users.users.greeter = {
    isSystemUser = true;
    group = "greeter";
  };
}
