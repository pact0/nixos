{pkgs, ...}: {
  config = {
    home.packages = [
      pkgs.waypaper
    ];
  };
}
