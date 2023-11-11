{ config, lib, pkgs, ... }:
{
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;
  environment.systemPackages = with pkgs; [
    cinnamon.cinnamon-common
    cinnamon.cinnamon-gsettings-overrides
    cinnamon.cinnamon-menus
    cinnamon.cinnamon-translations
    cinnamon.cinnamon-desktop
    cinnamon.folder-color-switcher
    cinnamon.muffin
    cinnamon.nemo-emblems
    cinnamon.nemo-fileroller
    cinnamon.nemo-python
    xdg-desktop-portal-xapp
  ];
}
