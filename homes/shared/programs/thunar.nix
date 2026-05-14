{pkgs, ...}: let
  # inherit (lib.modules) mkIf;
  # inherit (osConfig) modules;
  #
  # sys = modules.system;
  # prg = sys.programs;
  #
  # isThunar = defaults.fileManager == "thunar";
  thunar = pkgs.thunar.override {
    thunarPlugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
in {
  config = {
    home.packages = [
      thunar

      # previewers
      pkgs.ffmpegthumbnailer
      pkgs.webp-pixbuf-loader
      pkgs.gnome-epub-thumbnailer
      pkgs.mcomix
      pkgs.f3d
      pkgs.xfconf
      pkgs.libheif
      pkgs.gdk-pixbuf
    ];
  };
}
