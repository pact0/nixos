{lib, ...}:
with lib.types; {
  options.bootcfg = {
    availableKernelModules = lib.mkOption {
      type = listOf str;
      default = [];
      description = "Additional kernel modules made available in the initrd for this host.";
    };

    kernel = lib.mkOption {
      type = enum ["stable" "latest"];
      default = "latest";
      description = "Kernel packages to use: latest or stable.";
    };

    plymouth = lib.mkOption {
      type = submodule {
        options = {
          enable = lib.mkOption {
            type = bool;
            default = true;
            description = "Whether to enable the plymouth splash screen during boot.";
          };
          theme = lib.mkOption {
            type = str;
            default = "connect";
            description = "Plymouth splash theme, provided by pkgs.adi1090x-plymouth-themes.";
          };
        };
      };
      default = {};
      description = "Plymouth splash screen configuration.";
    };
  };
}
