{ config, lib, pkgs, ... }:
{
  users.users.faaiq = {
    isNormalUser = true;
    description = "faaiq";
    extraGroups = [ "networkmanager" "wheel" "audio" "vboxsf" "vboxusers" "video" "input" "adbusers"];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  nixpkgs.config.firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
    enableAdobeFlashDRM = true;
    jre = false;
    icedtea = true;
  };

  programs.firefox.package = pkgs.firefox.override {
    cfg = {
      enablePlasmaBrowserIntegration = true;
      };
  };
}
