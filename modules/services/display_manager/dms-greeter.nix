{inputs, ...}: {
  imports = [
    # inputs.dms.nixosModules.greeter
    inputs.dank-greeter.nixosModules.default
  ];

  programs.dms-greeter = {
    enable = true;
    compositor.name = "hyprland";
    # Hyprland 0.55+ is lua-only: the default hyprlang temp config fails to
    # parse and trips emergency mode on the greeter screen. Provide a lua config.
    compositor.customConfig = ''
      hl.env("DMS_RUN_GREETER", "1")
      hl.config({
        misc = {
          disable_hyprland_logo = true
        }
      })
    '';
    configHome = "/home/pacto";
  };
}
