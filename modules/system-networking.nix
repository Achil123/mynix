{ config, lib, pkgs, ... }:
{
  # Enable networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    networkmanager.insertNameservers = [ "8.8.8.8" "8.8.4.4" ];
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    extraHosts = ''
    192.168.0.11 gitlab-adinusa.id
    '';
  };

  # Wireless
  #networking.wireless = {
  #  enable = true;
  #  environmentFile = "/run/secrets/pass.env";
  #  interfaces = [ "wlp3s0" ];
  #  userControlled.enable = true;
  #  userControlled.group = "networkmanager";
  #  networks.Realme5i.psk = "@HOTSPOT@";
  #  networks."Siswa TKJ".psk = "@LAB1@";
  #};

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
