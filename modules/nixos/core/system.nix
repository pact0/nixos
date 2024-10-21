{
  self,
  pkgs,
  lib,
  inputs,
  ...
}: {
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nixpkgs = {
    overlays = [
      #self.overlays.default
      inputs.nur.overlay
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  system = {
    copySystemConfiguration = false;
    stateVersion = "24.05";
  };
}
