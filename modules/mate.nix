{ config, pkgs, ... }:
{
  services.xserver.desktopManager.mate.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  environment.systemPackages = with pkgs; [
    mate.mate-applets
    mate.mate-backgrounds
    mate.mate-common
    mate.mate-desktop
    mate.mate-icon-theme
    mate.mate-indicator-applet
    mate.mate-menus
    mate.mate-media
    mate.mate-notification-daemon
    mate.mate-polkit
    mate.mate-sensors-applet
    mate.mate-themes
    mate.mate-tweak
    mate.mate-utils
    mate.mate-user-share
  ];
}
