{pkgs, ...}: {
  environment = {
    shells = with pkgs; [
      zsh
      fish
      bash
    ];
    variables.FLAKE = "/home/pacto/nixos";
  };
}
