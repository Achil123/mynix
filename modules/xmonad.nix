{ config, lib, pkgs, ... }:
{
  environment.systemPackages =  with pkgs; [
    # Xorg
    xorg.xorgserver
    xorg.xinit
    xorg.xf86inputevdev
    xorg.xf86inputsynaptics
    xorg.xf86inputlibinput
    xorg.xf86videointel
    xorg.xf86videoati
    xorg.xf86videonouveau
    xorg.fontmiscmisc
    ucs-fonts

    # Other
    arc-icon-theme
    dzen2
    feh
    gtk2
    haskellPackages.xmobar
    hicolor-icon-theme
    networkmanagerapplet
    pa_applet
    pavucontrol
    shared-mime-info
    tango-icon-theme
    trayer
    vanilla-dmz
    xfce.ristretto
    xlockmore
  ];

  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
   windowManager.xmonad = {
     enable = true;
     enableContribAndExtras = true;
     extraPackages = haskellPackages:
       with haskellPackages; [
         alsa-mixer
       ];
   };
   desktopManager = {
     xterm.enable = false;
   };
   libinput.enable = true;
   displayManager.defaultSession = "none+xmonad";
   };

}
