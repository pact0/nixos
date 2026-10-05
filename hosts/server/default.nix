{pkgs, ...}: {
  imports = [
    ./hardware.nix
    ./size-reduction.nix
  ];

  networking.hostName = "nixos-vm";

  system.stateVersion = "25.05";

  bootcfg = {
    kernel = "stable";
    plymouth.enable = false;
  };

  users.users.root = {
    hashedPassword = "$2a$12$y/DJUovea.8BhiHItXKoaeXPw3mhbF0auqtmDhYziMn9J0uMSypte";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAE5/uWSV/qA1IjcdJbxqyF3ty1LMmpfTWve3zn2KgJ9 pacto@nixos"
    ];
  };

  users.users.pacto = {
    isNormalUser = true;
    description = "pacto";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    initialPassword = "nixos";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAE5/uWSV/qA1IjcdJbxqyF3ty1LMmpfTWve3zn2KgJ9 pacto@nixos"
    ];
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = false;
      X11Forwarding = false;
    };
  };

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    # fastfetch
    # btop
    # cowsay
    vim
  ];
}
