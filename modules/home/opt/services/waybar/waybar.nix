{pkgs, ...}: {
  home.packages = with pkgs; [
    wttrbar
  ];
  programs.waybar = {
    enable = true;
  };
}
