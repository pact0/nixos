{ pkgs, username, ... }: 
{
  programs.mpv = {
    enable = true;


    config = {
        profile = "gpu-hq";
        force-window = true;
        ytdl-format = "bestvideo+bestaudio";
        cache-default = 4000000;
    };
    #extraConfig = { 
    #  init.defaultBranch = "master";
    #  credential.helper = "store";
    #};
  };

   imports = [
    (import ./keybindings.nix)
    
    ];

  #home.packages = [ pkgs.gh ];
}