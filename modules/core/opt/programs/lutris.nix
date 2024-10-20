{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lutris
    # (lutris.override {
    #   extraPkgs = pkgs: [
    #     # List package dependencies here
    #     # wineWowPackages.stable
    #     # winetricks
    #   ];
    # })

    #   (lutris.override {
    #     extraLibraries = pkgs: [
    #       # List library dependencies here
    #     ];
    #   })
  ];
}
