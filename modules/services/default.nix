{
  imports = [
    ./display_manager

    ./printing.nix
    ./location.nix
    ./earlyoom.nix
  ];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = true;
    };
  };
}
