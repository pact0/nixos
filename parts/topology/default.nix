{
  inputs,
  self,
  ...
}: {
  imports = [
    inputs.nix-topology.flakeModule
  ];

  # https://github.com/oddlama/nix-topology
  perSystem = {pkgs, ...}: {
    topology = {
      modules = [
        ./nodes.nix
        ./networks.nix
      ];
    };
  };
}
