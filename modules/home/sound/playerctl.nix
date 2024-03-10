{pkgs, ...}: {
  home.packages = with pkgs; [playerctl pamixer];
  services.playerctld = {
    enable = true;
  };
}
