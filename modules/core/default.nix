{ inputs, nixpkgs, self, username, outputs, stylix, ...}:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in
{
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs username outputs stylix; };
    modules =[ 
      (import ./virtualization.nix)
      (import ./bootloader.nix)
      (import ./services.nix)
      (import ./hardware.nix)
      (import ./system.nix)
      (import ./user.nix)
      (import ./networking.nix)
      (import ./sound.nix)
      (import ../../nixos/configuration.nix)

      (import ./docker.nix)
      (import ./hyprpaper.nix)
      (import ./wayland.nix)
      (import ./xserver.nix)

    ];
  };
}