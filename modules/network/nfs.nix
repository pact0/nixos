{
  boot.supportedFilesystems = ["nfs"];

  fileSystems."/mnt/Media" = {
    device = "192.168.5.5:/mnt/Galaxy/Media";
    fsType = "nfs";

    options = [
      "nfsvers=4"
      "x-systemd.automount"
      "noauto"
      "soft"
      "timeo=30"
    ];
  };
}
