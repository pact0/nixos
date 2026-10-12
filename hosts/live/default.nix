{
  pkgs,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
  ];

  system.disableInstallerTools = lib.mkForce false;

  system.stateVersion = "26.11";

  # Seed this flake into the live rootfs, so that installation means
  #   nixos-install --flake /etc/nixos#<host>
  isoImage.contents = [
    {
      source = ../../.;
      target = "/etc/nixos";
    }
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAE5/uWSV/qA1IjcdJbxqyF3ty1LMmpfTWve3zn2KgJ9 pacto@nixos"
  ];

  users.users.nixos = {
    extraGroups = ["wheel"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAE5/uWSV/qA1IjcdJbxqyF3ty1LMmpfTWve3zn2KgJ9 pacto@nixos"
    ];
  };

  services.openssh.settings = {
    PermitRootLogin = "yes";
    PasswordAuthentication = false;
    KbdInteractiveAuthentication = false;
  };

  environment.systemPackages = with pkgs; [vim git jq curl];
}
