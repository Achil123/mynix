{ config, pkgs, ... }:

{
  imports = [
    # Desktop Environment & Window Manager
    #./gnome.nix
    #./xfce.nix
    ./kde.nix
    #./pantheon.nix
    #./xmonad.nix

    # Services
    ./audio.nix
    #./avahi.nix
    #./mpd.nix
    #./nextcloud.nix
    #./printing.nix

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
