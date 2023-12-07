{ config, pkgs, ... }: 

{
  environment.systemPackages =  with pkgs; [
    # Xorg
    #xorg.xbacklight
    xorg.xorgserver
    xorg.xinit
    xorg.xf86inputevdev
    xorg.xf86inputsynaptics
    xorg.xf86inputlibinput
    xorg.xf86videointel
    xorg.xf86videoati
    xorg.xf86videonouveau
    xorg.xprop
    xdg-user-dirs
    xclip
    xfce.xfce4-power-manager
    kitty
    maim
    rofi
    redshift
    dmenu
    scrot
    unclutter
    alacritty
    feh
    imagemagick
    blueman
    ffmpeg
    cinnamon.nemo
    light
  ];

  services.acpid.enable = true;

  services.xserver = {
    enable = true;

    libinput = {
      enable = true;
    };
    displayManager = {
      sddm.enable = true;
      defaultSession= "none+awesome";
    };
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
      ];
    };
  };
}
