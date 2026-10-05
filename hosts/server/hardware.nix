{
  inputs,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  disko.devices.disk.main = {
    device = "/dev/sda";
    type = "disk";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          size = "512M";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = ["umask=0077"];
          };
        };
        swap = {
          size = "2G";
          content = {
            type = "swap";
          };
        };
        root = {
          size = "100%";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    initrd = {
      availableKernelModules = [
        "virtio_pci"
        "virtio_scsi"
        "virtio_blk"
        "sd_mod"
        "sr_mod"
      ];
      supportedFilesystems = [
        "ext4"
        "vfat"
      ];
    };
  };

  boot.kernelParams = ["console=ttyS0"];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.system = lib.mkDefault "x86_64-linux";
}
