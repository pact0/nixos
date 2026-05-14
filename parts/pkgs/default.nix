{
  inputs,
  self,
  ...
}: {
  imports = [inputs.flake-parts.flakeModules.easyOverlay];
  perSystem = {
    config,
    pkgs,
    lib,
    ...
  }: {
    overlayAttrs = config.packages;
    packages = lib.mkMerge [
      (lib.packagesFromDirectoryRecursive {
        inherit (pkgs) callPackage;
        directory = ./packages;
      })

      {
        microvm = self.nixosConfigurations.microvm.config.microvm.declaredRunner;
      }
    ];
  };
}
