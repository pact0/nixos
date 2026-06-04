{lib, ...}: {
  nixpkgs = {
    config = {
      allowBroken = false;
      allowUnsupportedSystem = true;
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-39.8.10" # bitwarden-desktop
      ];
    };

    # overlays = [
    #   (final: prev: {
    #     lib = prev.lib // {
    #       colors = import "${self}/lib/colors" prev.lib;
    #     };
    #   })
    # ];
  };
}
