{ config, lib, pkgs, ... }:
{
  networking.firewall.allowedUDPPorts = [
    34197 # factorio
  ];
  environment.systemPackages = with pkgs; [
    dwarf-fortress
    dwarf-therapist
    keen4
    steam
    xboxdrv
    zsnes
  ];
  hardware.steam-hardware.enable = true;
  };
}
