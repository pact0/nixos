{pkgs, ...}: {
  config = {
    home.packages = with pkgs; [
      koreader
    ];
  };
}
