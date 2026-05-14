{
  imports = [
    ./nh.nix
    ./nix.nix
    ./nixpkgs.nix
    ./substituters.nix
  ];
  programs.nix-ld.enable = true;
}
