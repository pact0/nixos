{username, ...}: {
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;

    getty.autologinUser = username;
  };

  services.xserver = {
    enable = true;
    xkb.layout = "pl";
    updateDbusEnvironment = true;
    # displayManager.startx.enable = true;
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "${username}";
  };

  services.libinput = {
    enable = true;
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
