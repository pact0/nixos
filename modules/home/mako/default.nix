{
  config,
  pkgs,
  ...
}: {
  services = {
    mako = {
      enable = true;
      sort = "-time";
      layer = "overlay";
      padding = "15";
      defaultTimeout = 5000;
      borderSize = 2;
      borderRadius = 5;
      icons = true;
      actions = true;
    };
  };
}
