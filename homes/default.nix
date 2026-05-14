{
  pkgs,
  self,
  self',
  inputs',
  inputs,
  ...
}: let
  specialArgs = {
    inherit
      inputs
      self
      inputs'
      self'
      # defaults
      ;
  };
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./pacto
  ];

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  home-manager = {
    verbose = true;

    extraSpecialArgs = specialArgs;

    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "hm.old";
  };
}
