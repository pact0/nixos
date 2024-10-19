{
  inputs,
  outputs,
  lib,
  config,
  colors,
  system,
  theme,
  nixpkgs,
  pkgs,
  ...
}: let
  nixvim' = inputs.nixvim.packages."x86_64-linux".default;
  nvim = nixvim'.extend {
    config.theme = theme;
  };
in {
  imports = [
    ./hardware-configuration.nix
  ];

  #nixpkgs = {
  #  # You can add overlays here
  #  overlays = [
  #    # Add overlays your own flake exports (from overlays and pkgs dir):
  #    outputs.overlays.additions
  #    outputs.overlays.modifications
  #    outputs.overlays.unstable-packages

  #  ];
  #};

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
  };

  environment.sessionVariables = {
    FLAKE = "/home/pacto/nixos";
  };

  environment.systemPackages = with pkgs; [
    nh
    nvim
  ];
}
