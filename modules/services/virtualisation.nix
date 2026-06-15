{pkgs, ...}: {
  environment.systemPackages = with pkgs; [virt-manager];

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
}
