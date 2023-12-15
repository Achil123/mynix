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
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-rounded;
      extraPackages = with pkgs; [
        pavucontrol
        sakura
        xfce.thunar
        calc
        pywal
        networkmanager_dmenu
        networkmanagerapplet
        rofi
        polybarFull
        dunst
        blueman
        i3status
        i3lock
        i3blocks
        lxappearance
        libnotify
        maim
        feh
        xdotool
        libcanberra
        imagemagick
        sublime
      ];
    };
  };
}
