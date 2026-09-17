{pkgs, ...}: {
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
