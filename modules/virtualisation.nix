{ config, lib, pkgs, ... }:
{
  # Virtualbox
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.host.addNetworkInterface = false;
  #virtualisation.virtualbox.guest.enable = true;
  #virtualisation.virtualbox.guest.x11 = true;

  # Disable Module
  imports = [ <nixpkgs/nixos/modules/virtualisation/virtualbox-host.nix> ];
  disabledModules = [ "virtualisation/virtualbox-host.nix" ];


  # Docker
  #virtualisation.docker.enable = true;

  # Podman
  #virtualisation.podman.enable = true;
}
