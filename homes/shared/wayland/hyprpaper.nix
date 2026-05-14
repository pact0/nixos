{pkgs, ...}: {
  home.packages = [pkgs.hyprpaper];

  # services.hyprpaper = {
  #   enable = true;
  #   package = pkgs.hyprpaper;
  # };
}
