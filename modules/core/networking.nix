{ pkgs, ... }: 
{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = [ "192.168.50.1" ];
    firewall = {
      enable = false;
      allowedTCPPorts = [ 22 80 443 59010 59011 3000 3001 ];
      allowedUDPPorts = [ 59010 59011 3000 3001];
      # allowedUDPPortRanges = [
        # { from = 4000; to = 4007; }
        # { from = 8000; to = 8010; }
      # ];
    };
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
