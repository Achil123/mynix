{ config, pkgs, ... }:
{
  environment.systemPackages =  with pkgs; [
    light

    # Other
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
     })
    )
    dunst
    libnotify
    swww
    rofi-wayland
    kitty
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSOR = "1";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };

  #environment.etc = {
  #  "xdg/gtk-3.0" .source = ./gtk-3.0;
  #};
}
