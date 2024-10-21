{
  pkgs,
  config,
  ...
}: {
  hardware = {
    graphics.enable = true;
    enableRedistributableFirmware = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;

      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };

    # tablet
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  powerManagement.cpuFreqGovernor = "performance";
  services.xserver.videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # OBS
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
  };
}
