{
  pkgs,
  config,
  ...
}: {
  hardware = {
    graphics.enable = true;
    # hardware.graphics.driSupport32Bit = true;
    enableRedistributableFirmware = true;
    graphics.extraPackages = with pkgs; [
    ]; # or "nvidiaLegacy470 etc.

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

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # OBS
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
  };
}
