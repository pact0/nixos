{
  pkgs,
  lib,
  config,
  ...
}: let
  plymouthCfg = config.bootcfg.plymouth;
in {
  boot = {
    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ext4"];

      availableKernelModules = config.bootcfg.availableKernelModules;
    };

    kernelPackages =
      if config.bootcfg.kernel == "latest"
      then pkgs.linuxPackages_latest
      else pkgs.linuxPackages;

    consoleLogLevel = 3;
    kernelParams =
      [
        "quiet"
        "systemd.show_status=auto"
        "rd.udev.log_level=3"
      ]
      ++ lib.optionals plymouthCfg.enable [
        "plymouth.use-simpledrm"
      ];

    loader = {
      # systemd-boot on UEFI
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    plymouth = lib.mkIf plymouthCfg.enable {
      enable = true;
      themePackages = [
        (pkgs.adi1090x-plymouth-themes.override {
          selected_themes = [plymouthCfg.theme];
        })
      ];
      inherit (plymouthCfg) theme;
    };
  };

  # plymouth theme is managed by bootcfg, not stylix
  stylix.targets.plymouth.enable = lib.mkIf plymouthCfg.enable false;

  environment.systemPackages = [config.boot.kernelPackages.cpupower];
}
