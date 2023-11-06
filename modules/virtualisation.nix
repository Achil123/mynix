{ config, lib, pkgs, ... }:
{
  # Virtualbox
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.host.addNetworkInterface = false;
 
  # Docker
  #virtualisation.docker.enable = true;

  # Podman
  #virtualisation.podman.enable = true;
}
