{ config, lib, pkgs, ... }:
{
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  environment.xfce.excludePackages = [ pkgs.xfce.xfce4-appfinder ];
  environment.systemPackages = with pkgs; [
    gnome.file-roller
    xfce.xfce4-xkb-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-panel-profiles
    xfce.xfce4-clipman-plugin
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.libxfce4util
    xfce.libxfce4ui
    xdg-desktop-portal-xapp
    indicator-application-gtk2
  ];
}
