{ config, lib, pkgs, ... }:
{
  services.xserver = {
    desktopManager.budgie.enable = true;
    displayManager.lightdm.enable = true;
  };
  environment.systemPackages = with pkgs; [
    cinnamon.folder-color-switcher
    cinnamon.nemo-emblems
    cinnamon.nemo-fileroller
    cinnamon.nemo-python
  ];
  environment.budgie.excludePackages = with pkgs; [
    mate.mate-terminal
  ];
  programs.gnome-terminal.enable = true;
}
