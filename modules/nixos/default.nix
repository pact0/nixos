{
  inputs,
  nixpkgs,
  nixpkgs-unstable,
  self,
  username,
  theme,
  outputs,
  stylix,
  ...
}: let
  system = "x86_64-linux";
  pkgs = import nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };
  lib = pkgs.lib;
in {
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs username outputs stylix theme pkgs;};
    modules = [
      (import ./user.nix)
      (import ./core)
      (import ./opt)
      (import ../../nixos/configuration.nix)

      (import ./wayland.nix)
      (import ./firejail)
    ];
  };
}
