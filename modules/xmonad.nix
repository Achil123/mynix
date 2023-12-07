{ config, lib, pkgs, ... }:
{
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
    # synaptics = {
    #   enable = true;
    #   twoFingerScroll = true;
    #   accelFactor = "1.2";
    #   fingersMap = [ 1 3 2];
    # };
   libinput.enable = true;
   displayManager.sessionCommands = ''
     export GTK_DATA_PREFIX=${config.system.path}
     export GTK_PATH=${config.system.path}/lib/gtk-3.0:${config.system.path}/lib/gtk-2.0
     export XCURSOR_PATH=~/.icons:~/.nix-profile/share/icons:/var/run/current-system/sw/share/icons
     ${pkgs.xorg.xset}/bin/xset r rate 220 50
     if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]]; then
       eval "$(${pkgs.dbus.out}/bin/dbus-launch --sh-syntax --exit-with-session)"
       export DBUS_SESSION_BUS_ADDRESS
     fi
   '';
   displayManager.defaultSession = "none+xmonad";
   };

   environment.systemPackages = with pkgs; [
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
     xorg.xbacklight
   ];
}
