{
  pkgs,
  inputs',
  inputs,
  ...
}: {
  imports = [inputs.vicinae.homeManagerModules.default];

  programs.vicinae = {
    enable = true;
    package = pkgs.vicinae;
    systemd = {
      enable = true;
      autoStart = true;
    };

    settings = {
      consider_preedit = true;
      pop_to_root_on_close = true;
      favicon_service = "twenty";
      search_files_in_root = true;
      # close_on_focus_loss = true;
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
