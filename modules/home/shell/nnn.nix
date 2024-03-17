{pkgs, ...}: {
  programs.nnn = {
    enable = true;
    bookmarks = {
      w = "~/Work";
      d = "~/Downloads";
      D = "~/Documents";
      p = "~/Pictures";
    };
    # extraPackages = [
    #   ffmpegthumbnailer
    #   mediainfo
    #   sxiv
    #   dragdrop
    # ];
    plugins = {
      src =
        (pkgs.fetchFromGitHub {
          owner = "jarun";
          repo = "nnn";
          rev = "v4.0";
          sha256 = "sha256-Hpc8YaJeAzJoEi7aJ6DntH2VLkoR6ToP6tPYn3llR7k=";
        })
        + "/plugins";
      mappings = {
        c = "fzcd";
        f = "finder";
        v = "imgview";
        p = "preview-tui";
      };
    };
  };

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
}
