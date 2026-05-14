{
  inputs',
  osConfig,
  pkgs,
  lib,
  ...
}: let
  # inherit (lib) mkIf;
  #
  # inherit (osConfig) modules;
  #
  # env = modules.usrEnv;
  # prg = env.programs;
  # cfg = prg.media;
in {
  config = {
    home.packages = with pkgs; [
      # tools that help with media operations/management
      ffmpeg-full
      yt-dlp
      mpc
      playerctl
      pavucontrol
      pulsemixer
      pulseaudio
      imv
      cantata
      easytag
      kid3
      musikcube
      termusic
      ani-cli
    ];

    services.playerctld.enable = true;
  };
}
