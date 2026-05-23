{lib, ...}: {
  nixpkgs = {
    config = {
      allowBroken = false;
      allowUnsupportedSystem = true;
      allowUnfree = true;
      permittedInsecurePackages = [
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
