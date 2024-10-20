{
  imports = [
    ./xserver.nix
  ];

  config = {
    services = {
      xserver.enable = true;

      # bt
      blueman.enable = true;
      dbus.enable = true;
      upower.enable = true;
      logind = {
        powerKey = "suspend";
        lidSwitch = "suspend";
        lidSwitchExternalPower = "lock";
      };

      gnome = {
        gnome-keyring.enable = true;
        glib-networking.enable = true;
      };
    };
  };
}
