{ pkgs, config, lib, ... }:
{
  services.create_ap = {
    enable = true;
    settings = {
      INTERNET_IFACE = "enp2s0";
      WIFI_IFACE = "wlan-station0";
      SSID = "My Wifi Hotspot";
      PASSPHRASE = "12345678";
    };
  };
}
