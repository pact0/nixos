{
  osConfig,
  pkgs,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf mkMerge;
  inherit (osConfig) modules;

  env = modules.usrEnv;
  prg = env.programs;
  # low1k = import ./low1k.nix {inherit pkgs;};
in {
  config = {
    home.packages = with pkgs; [
      python314Packages.subliminal
    ];
    programs.mpv = {
      enable = true;

      # config = {
      #   ytdl-format = "bestvideo+bestaudio/best";
      #   audio-display = false;
      #   force-window = true;
      #   hidpi-window-scale = true;
      #   hwdec = "auto";
      #   keep-open = true;
      #   keep-open-pause = false;
      #   osd-on-seek = false;
      #   profile = "gpu-hq";
      #   script-opts = "osc-seekbarstyle=knob,osc-deadzonesize=1,osc-minmousemove=1";
      #   slang = "chi";
      #   sub-auto = "fuzzy";
      #   sub-codepage = "gbk";
      #   osc = "no";
      #   osd-bar = "no";
      #   border = "no";
      # };

      config = {
        ytdl-format = "bestvideo+bestaudio/best";
        profile = "gpu-hq";
        save-position-on-quit = "yes";
        hwdec = "auto";
        video-sync = "display-resample";
        interpolation = true;
        tscale = "oversample";
        fullscreen = true;

        sub-auto = "fuzzy";
        sub-blur = 10;
        sub-file-paths = "subs:subtitles";

        screenshot-format = "png";

        title = "\${filename} - mpv";
        script-opts = "osc-title=\${filename},osc-boxalpha=150,osc-visibility=never,osc-boxvideo=yes";

        osc = "no";
        osd-on-seek = "no";
        osd-bar = "no";
        osd-bar-w = 30;
        osd-bar-h = "0.2";
        osd-duration = 750;

        really-quiet = "yes";
        autofit = "65%";
      };

      scripts = with pkgs.mpvScripts; [
        cutter # cut and automatically concat videos
        mpris # MPRIS plugin
        thumbnail # OSC seekbar thumbnails
        thumbfast # on-the-fly thumbnailer
        sponsorblock # skip sponsored segments
        uosc # proximity UI
        quality-menu # ytdl-format quality menu
        autosub
        autosubsync-mpv

        # TODO: CHECK
        # seekTo # seek to specific pos.
        # autoload # auto loads playlists
      ];

      # bindings = mkMerge [
      #   # mpv keybindings
      #   {
      #     "Y" = "add sub-scale +0.1"; # increase subtitle font size
      #     "G" = "add sub-scale -0.1"; # decrease subtitle font size
      #     "y" = "sub_step -1"; # immediately display next subtitle
      #     "g" = "sub_step +1"; # previous
      #     "R" = "cycle_values window-scale 2 0.5 1"; # switch between 2x, 1/2, unresized window size
      #
      #     "l" = "seek 5";
      #     "h" = "seek -5";
      #     "j" = "seek -60";
      #     "k" = "seek 60";
      #
      #     "s" = "cycle sub";
      #     "a" = "cycle audio";
      #
      #     "Alt+h" = "add chapter -1";
      #     "Alt+l" = "add chapter 1";
      #     "Ctrl+SPACE" = "add chapter 1";
      #
      #     "Alt+j" = "add video-zoom -0.25";
      #     "Alt+k" = "add video-zoom 0.25";
      #
      #     "Alt+J" = "add sub-pos -1";
      #     "Alt+K" = "add sub-pos +1";
      #
      #     "Ctrl+h" = "multiply speed 1/1.1";
      #     "Ctrl+l" = "multiply speed 1.1";
      #     "Ctrl+H" = "set speed 1.0";
      #   }
      #
      #   # merge low1k's keybindings into mpv bindings section
      #   low1k
      # ];
    };
  };
}
