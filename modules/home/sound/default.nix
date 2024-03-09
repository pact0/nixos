{inputs, ...}: {
  imports = [
     (import ./pavucontrol.nix)
     (import ./playerctl.nix)
     (import ./spotify.nix)
  ];
}