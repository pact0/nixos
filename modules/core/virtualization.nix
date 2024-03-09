{ pkgs, ... }:
{
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.x11 = true;
}