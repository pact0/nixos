{ pkgs, username, ... }:
{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    #storageDriver = storageDriver;
    autoPrune.enable = true;
  };

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
