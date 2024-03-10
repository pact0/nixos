{
  pkgs,
  username,
  ...
}: {
  services.xserver = {
    enable = true;
    xkb.layout = "pl";
    updateDbusEnvironment = true;
    # displayManager.startx.enable = true;
    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
