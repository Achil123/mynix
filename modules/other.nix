{ config, lib, pkgs, ... }:
{

  # fix for Intel CPU throttling
  services.throttled.enable = true;
  #services.thermald.enable = true;
  
  # XServer Configuration
  services.xserver = {
    enable = true;
    libinput.enable = true;
    layout = "us";
    xkbVariant = "";
  };

  # Enable autologin
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "faaiq";

  # fwupd
  services.fwupd.enable = true;

  # haveged
  services.haveged.enable = true;
}
