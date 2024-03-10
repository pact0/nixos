{
  pkgs,
  lib,
  ...
}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
  };
  programs.gamemode.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-runtime"
    ];

  environment.systemPackages = with pkgs; [
    (lutris.override {
      extraPkgs = pkgs: [
        # List package dependencies here
        wineWowPackages.stable
        winetricks
      ];
    })

    #   (lutris.override {
    #     extraLibraries = pkgs: [
    #       # List library dependencies here
    #     ];
    #   })
  ];

  # environment.systemPackages = [pkgs.prismlauncher];
}
