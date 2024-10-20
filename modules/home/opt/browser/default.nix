{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    (import ./firefox.nix)
    (import ./brave.nix)
  ];
}
