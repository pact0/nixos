{
  imports = [
    ./programs
    ./services

    ./options.nix
    ./pkgs.nix
    ./user.nix
  ];

  steam.enable = true;

  #   # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
