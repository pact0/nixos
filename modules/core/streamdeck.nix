{
  inputs,
  pkgs,
  ...
}: {
  programs.streamdeck-ui = {
    enable = true;
    autoStart = false; # need to start via hyprland to get all commands to work properly
  };
}
