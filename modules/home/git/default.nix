{ pkgs, username, ... }: 
{

  programs.foot.enable = true;
  programs.git = {
    enable = true;
    
    userName = username;
    userEmail = "kuba.kowalski21331@gmail.com";
    
    extraConfig = { 
      init.defaultBranch = "master";
      credential.helper = "store";
      safe.directory = "/home/pacto/dotfiles";
    };
  };

  home.packages = [ pkgs.gh ];
}