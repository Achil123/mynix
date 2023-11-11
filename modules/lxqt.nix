{ config, lib, pkgs, ... }:

{
  services.xserver = {
    displayManager.sddm.enable = true;
    desktopManager.lxqt.enable = true;
  };
  environment.systemPackages = with pkgs; [
    lxqt.qlipper
    lxqt.qtxdg-tools
    lxqt.qtermwidget
    lxqt.lxqt-qtplugin
    lxqt.lxqt-build-tools
    lxqt.compton-conf
    lxqt.libsysstat
    lxqt.libqtxdg
    lxqt.libfm-qt
  ];
  services.picom.enable = true;
}
