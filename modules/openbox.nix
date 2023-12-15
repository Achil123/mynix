{ config, pkgs, ... }:

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
  ];

  environment.pathsToLink = [ "/libexec" ];

  programs.dconf.enable = true;
  services.blueman.enable = true;

  services.xserver = {
    displayManager = {
      defaultSession = "none+openbox";
    };

    windowManager.openbox = {
      enable = true;
    };
  };
}
