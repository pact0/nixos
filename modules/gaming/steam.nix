{
  pkgs,
  inputs,
  ...
}: {
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };

    steam = {
      enable = true;

      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];

      gamescopeSession.enable = true;
    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          softrealtime = "auto";
          renice = 15;
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [
    (pkgs.symlinkJoin {
      name = "awakened-poe-trade-wrapped";
      paths = [pkgs.awakened-poe-trade];
      buildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/awakened-poe-trade \
          --set XDG_SESSION_TYPE x11 \
          --add-flags "--ozone-platform=x11 --force-device-scale-factor=1"
      '';
    })

    (pkgs.symlinkJoin {
      name = "exiled-exchange-2-wrapped";
      paths = [inputs.self.packages.${pkgs.system}.exiled-exchange-2];

      nativeBuildInputs = [pkgs.makeWrapper];

      postBuild = ''
        wrapProgram $out/bin/exiled-exchange-2 \
          --set XDG_SESSION_TYPE x11 \
          --add-flags "--ozone-platform=x11 --force-device-scale-factor=1"
      '';
    })

    mangohud
    # winetricks (all versions)
    winetricks
    wineWow64Packages.waylandFull
    (heroic.override {
      extraPkgs = pkgs':
        with pkgs'; [
          gamescope
          gamemode
        ];
    })
  ];

  hardware.xpadneo = {
    enable = true;
    # quirks = true;
  };
}
