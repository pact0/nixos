{pkgs, ...}: {
  virtualisation = {
    virtualbox = {
      guest.enable = true;
      host.enableExtensionPack = true;
      # guest.x11 = true;
    };

    libvirtd.enable = true;
    docker = {
      enable = true;
      enableOnBoot = true;
      autoPrune.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
