{
  imports = [
    ./display_manager

    ./printing.nix
    ./location.nix
    ./earlyoom.nix

    ./virtualisation.nix
  ];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = true;
    };
  };
}
