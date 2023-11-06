{ config, lib, pkgs, ... }:
{
  # Power Management Nix
  powerManagement = {
    enable = true;
    cpufreq.min = 800000;
    cpufreq.max = 2200000;
  #  powerUpCommands = ''
  #    "hdparm -t -B 255 /dev/sda"
  #  '';
  #  powerDownCommands = ''
  #    "hdparm -B 255 /dev/sda"
  #  '';
  };

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "schedutil";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "never";
    };
  };
}
