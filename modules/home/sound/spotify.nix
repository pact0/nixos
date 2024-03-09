{ pkgs, ... }:
{
  home.packages = with pkgs; [ spotifyd ];
  services.spotifyd = {
    enable = true;
  };
}
