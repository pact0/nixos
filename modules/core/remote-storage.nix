{...}: {
  fileSystems."/mnt/media" = {
    device = "192.168.50.5:/mnt/Storage/Media";
    fsType = "nfs";
  };

  services = {
    rpcbind.enable = true;
    nfs.server.enable = true;
  };
}
