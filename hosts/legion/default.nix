{
  inputs',
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix
  ];

  networking.hostName = "legion";

  monitors = {
    kanshi = {
      enable = true;
      profiles = [
        {
          profile = {
            name = "Docked";
            outputs = [
              {
                criteria = "LG Electronics M2252D 0x01010101";
                position = "0,0";
                mode = "1920x1080@60Hz";
              }
              {
                criteria = "Chimei Innolux Corporation 0x15E8";
                position = "1920,0";
                mode = "1920x1080@60Hz";
                # scale = 1.5;
              }
            ];
          };
        }
        {
          profile = {
            name = "Undocked";
            outputs = [
              {
                criteria = "Chimei Innolux Corporation 0x15E8";
                status = "enable";
                # scale = 1.5;
              }
            ];
          };
        }
      ];
    };

    dms.monitorWallpapers = {
      HDMI-A-1 = "/home/pacto/wallpapers/wallhaven-5gwvz5.jpg";
      eDP-1 = "/home/pacto/wallpapers/wallhaven-9o8k9w.jpg";
    };
  };
}
