{ config, pkgs, ... }:

{
  imports = [
    # Desktop Environment & Window Manager #
    #./awesome.nix
    #./budgie.nix
    #./bspwm.nix
    #./cinnamon.nix
    #./deepin.nix
    #./gnome.nix
    #./hyprland.nix
    #./herbstluftwm.nix
    ./i3wm.nix
    #./kde.nix
    #./lxqt.nix
    #./mate.nix
    #./pantheon.nix
    #./xfce.nix
    #./xmonad.nix

    # Services #
    ./audio.nix
    #./avahi.nix
    #./cpu.nix
    #./hotspot.nix
    #./mpd.nix
    #./nextcloud.nix
    #./printing.nix
    ./other.nix
    ./xserver.nix

    ./fonts.nix
    #./games.nix
    ./gamepad.nix
    ./nvim.nix
    ./system-packages.nix
    ./system-configuration.nix
    ./system-networking.nix
    #./tinc.nix
    ./users.nix
    ./virtualisation.nix
  ];
}
