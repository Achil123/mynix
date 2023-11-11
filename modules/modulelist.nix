{ config, pkgs, ... }:

{
  imports = [
    # Desktop Environment & Window Manager
    #./awesome.nix
    #./budgie.nix
    #./cinnamon.nix
    #./deepin.nix
    #./gnome.nix
    #./kde.nix
    ./lxqt.nix
    #./mate.nix
    #./pantheon.nix
    #./xfce.nix
    #./xmonad.nix

    # Services
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
    ./system-packages.nix
    ./system-configuration.nix
    ./system-networking.nix
    #./tinc.nix
    ./users.nix
    ./virtualisation.nix
  ];
}
