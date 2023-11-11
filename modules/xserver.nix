{ config, lib, pkgs, ... }:
{
  # XServer Configuration
  services.xserver = {
    enable = true;
    libinput.enable = true;
    layout = "us";
    xkbVariant = "";
  };
}
