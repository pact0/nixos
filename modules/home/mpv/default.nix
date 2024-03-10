{
  pkgs,
  username,
  ...
}: {
  programs.mpv = {
    enable = true;

    config = {
      profile = "gpu-hq";
      force-window = true;
      ytdl-format = "bestvideo+bestaudio";
      cache-default = 4000000;
      save-position-on-quit = "yes";
      keep-open = "yes";
    };
  };

  imports = [
    (import ./keybindings.nix)
  ];
}
