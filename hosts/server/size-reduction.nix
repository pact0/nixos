{
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/perlless.nix")
  ];

  system.disableInstallerTools = true;
  documentation.man.enable = false;

  services = {
    speechd.enable = false;
    pipewire.enable = false;
    libinput.enable = false;
  };

  hardware.graphics.enable = false;

  fonts = {
    enableDefaultPackages = false;
    fontconfig.enable = false;
    packages = lib.mkForce [pkgs.dejavu_fonts];
  };

  programs.nh = {
    enable = lib.mkForce false;
    clean.enable = lib.mkForce false;
  };
}
