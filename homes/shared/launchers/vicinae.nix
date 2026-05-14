{
  inputs',
  inputs,
  ...
}: {
  imports = [inputs.vicinae.homeManagerModules.default];

  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;

      # environment = {
      #   USE_LAYER_SHELL = 1;
      # };
    };

    settings = {
      close_on_focus_loss = true;
      # telemetry = false;

      # providers = {
      #   "@Gelei/bluetooth-0" = {
      #     preferences = {
      #       connectionToggleable = true;
      #     };
      #   };
      #   "applications" = {
      #     preferences = {
      #       launchPrefix = "uwsm app -- ";
      #     };
      #   };
      # };
    };

    extensions = with inputs'.vicinae-extensions.packages; [
      # bluetooth
      # nix
      pulseaudio
      # wifi-commander
      # power-profile
      # hypr-keybinds
    ];
  };
}
