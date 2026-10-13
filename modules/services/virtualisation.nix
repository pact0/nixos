{pkgs, ...}: {
  environment.systemPackages = with pkgs; [virt-manager];

  virtualisation.libvirtd.enable = true;

  # podman replaces docker: daemonless/rootless, nothing on the boot path
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;

    # transparent docker drop-in: docker CLI + /run/docker.sock talk to podman
    dockerCompat = true;
    dockerSocket.enable = true;

    defaultNetwork.settings.dns_enabled = true;
  };
}
