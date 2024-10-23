{pkgs, ...}: {
  home.packages = with pkgs; [
    xdragon
    sxiv
    imv
    ffmpegthumbnailer
    mediainfo
    mktemp
    ffmpeg
    poppler
    glow
    lynx
    less
  ];

  programs.zathura = {
    enable = true;

    options = {
    };
    mappings = {
    };
  };
}
