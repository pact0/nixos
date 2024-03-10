{pkgs, ...}: {
  home.packages = with pkgs; [spotifyd spotify];
  services.spotifyd = {
    enable = true;
  };
}
