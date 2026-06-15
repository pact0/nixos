{
  inputs',
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix
  ];

  networking.hostName = "nixos";

  monitors = {
    kanshi = {
      enable = true;
      profiles = [
        {
          profile = {
            name = "Main";
            outputs = [
              {
                criteria = "LG Electronics LG HDR WQHD 0x000A9219";
                position = "1920,0";
                mode = "3440x1440@75.05Hz";
              }
              {
                criteria = "BNQ ZOWIE XL LCD 47G00713SL0";
                position = "0,0";
                mode = "1920x1080@60Hz";
              }
            ];
          };
        }
      ];
    };

    dms = {
      screenPreferences = {
        dock = [];
        notepad = [
          {
            model = "LG HDR WQHD";
            name = "DP-1";
          }
        ];
        notifications = [
          {
            model = "LG HDR WQHD";
            name = "DP-1";
          }
        ];
        osd = [
          {
            model = "LG HDR WQHD";
            name = "DP-1";
          }
        ];
        toast = [
          {
            model = "LG HDR WQHD";
            name = "DP-1";
          }
        ];
        wallpaper = [
          "all"
        ];
      };

      monitorWallpapers = {
        DP-1 = "/home/pacto/wallpapers/wallhaven-5gwvz5.jpg";
        DP-2 = "/home/pacto/wallpapers/wallhaven-9o8k9w.jpg";
      };

      barScreenPreferences = [
        {
          model = "LG HDR WQHD";
          name = "DP-1";
        }
      ];
    };
  };
}
