{inputs, ...}: {
  imports = [
    inputs.nix-topology.flakeModule
  ];

  # https://github.com/oddlama/nix-topology
  perSystem = _: {
    topology = {
      modules = [
        ./nodes.nix
        ./networks.nix
      ];
    };
  };
}
