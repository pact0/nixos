{pkgs, ...}: {
  imports = [
    ./avahi.nix
    ./tailscale.nix
    ./ssh.nix
    ./bluetooth.nix
    ./nfs.nix
  ];

  config = {
    networking = {
      networkmanager = {
        enable = true;
        # dns = "systemd-resolved";
        wifi.powersave = true;
        plugins = [
          pkgs.networkmanager-openvpn
        ];
      };
    };
  };
}
