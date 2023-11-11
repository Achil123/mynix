{ config, lib, pkgs, ... }:

{
  services.xserver = {
    desktopManager.deepin.enable = true;
  };
}
