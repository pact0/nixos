{
  imports = [
    ./options.nix

    # ./bin
    ./utils

    ./browser
    ./launcher
    ./lock
    ./discord
    ./misc
    ./music
    ./mpv
    ./obs
    # ./services
    # ./shell
    ./terminal
    # ./wayland
    ./nvim
    ./programs.nix
  ];

  opt = {
    music = {
      spicetify.enable = true;
    };

    launcher.anyrun = {
      enable = true;
    };

    misc = {
      obsidian.enable = true;
    };

    lock = {
      hyprlock.enable = true;
    };
  };
}
