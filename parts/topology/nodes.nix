{config, ...}: let
  inherit
    (config.lib.topology)
    mkInternet
    mkRouter
    mkSwitch
    mkConnection
    ;
in {
  # Add a node for the internet
  nodes.internet = mkInternet {
    connections = mkConnection "router" "wan1";
  };

  nodes.router = mkRouter "Dell" {
    info = "Dell PfSense";
    # image = ./images/fritzbox.png;
    interfaceGroups = [
      ["eth1" "eth2" "eth3" "eth4"]
      ["wan1"]
    ];
    # connections.eth1 = mkConnection "host1" "wan";
    interfaces.eth1 = {
      addresses = ["192.168.50.1"];
      network = "home";
    };
  };
}
