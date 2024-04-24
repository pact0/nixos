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
    specialArgs = {inherit self inputs username outputs stylix theme;};
    modules = [
      #(import ./virtualization.nix)
      (import ./bootloader.nix)
      (import ./services.nix)
      (import ./hardware.nix)
      (import ./system.nix)
      (import ./user.nix)
      (import ./networking.nix)
      (import ./sound.nix)
      (import ../../nixos/configuration.nix)
      (import ./streamdeck.nix)

      (import ./docker.nix)
      (import ./wayland.nix)
      (import ./xserver.nix)
      (import ./steam.nix)
      (import ./remote-storage.nix)
      (import ./firejail)
    ];
  };
}
