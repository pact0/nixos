{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  #xdg.configFile."hypr/hyprpaper.conf".text = ''
  #  preload = ${config.theme.wallpaper}
  #  wallpaper = , ${config.theme.wallpaper}
  #'';

  systemd.user.services.hyprpaper = {
    enable = true;
  };
}
