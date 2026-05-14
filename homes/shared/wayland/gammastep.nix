{
  services.gammastep = {
    enable = false;
    tray = true;

    provider = "geoclue2";

    enableVerboseLogging = true;
    settings.general.adjustment-method = "wayland";
  };
}
