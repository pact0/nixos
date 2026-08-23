{inputs, ...}: let
  mkNode = name: config: let
    inherit (config.meta) system;
    deployLib = inputs.deploy-rs.lib.${system};
  in {
    hostname = "${name}.example.local";
    sshOpts = ["-p" "22"];
    skipChecks = true;

    # We are currently currently only a single profile system
    profilesOrder = ["system"];
    profiles.system = {
      sshUser = "root";
      user = "root";
      path = deployLib.activate.nixos config;
    };
  };
in {
  inherit mkNode;
}
