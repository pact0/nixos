{disc, ...}: {
  disko.devices = {
    disk = {
      main = {
        device = "/dev/sda"; # typical VM disk, adjust if different (e.g., /dev/sda)
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            root = {
              size = "100%"; # take remaining space after boot
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
            swap = {
              size = "1G"; # adjust size as needed
              content = {
                type = "swap";
                resumeDevice = true; # enable hibernation support
              };
            };
          };
        };
      };
    };
  };
}
