{ config, lib, pkgs, ... }:
{
  networking.hostName = "nixos";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.insertNameservers = [ "8.8.8.8" "8.8.4.4" ];
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

  # Wlan
  #networking.wlanInterfaces = {
  #  wlan-station0 = {
  #     device = "wlp3s0";
  #  };
  #  #wlan-adhoc0 = {
  #  #  type = "ibss";
  #  #  device = "wlp3s0";
  #  #  mac = "02:00:00:00:00:01";
  #  #};
  #  #wlan-p2p0 = {
  #  #  device = "wlp3s0";
  #  #  mac = "02:00:00:00:00:02";
  #  #};
  #  wlan-ap0 = {
  #    device = "wlp3s0";
  #    mac = "02:00:00:00:00:03";
  #  };
  #};
}
