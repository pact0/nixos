{
  pkgs,
  config,
  ...
}: {
  boot = {
    bootspec.enable = true;

    kernelModules = [];
    extraModulePackages = [];

    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ext4"];

      availableKernelModules = ["ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod"];
      kernelModules = [];
    };

    # use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
      "plymouth.use-simpledrm"
    ];

    loader = {
      # systemd-boot on UEFI
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    plymouth.enable = true;
  };

  environment.systemPackages = [config.boot.kernelPackages.cpupower];
}
