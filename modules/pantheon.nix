{ config, lib, pkgs, ... }:
{
  services.xserver.desktopManager.pantheon.enable = true;
  services.xserver.displayManager.lightdm.greeters.pantheon.enable = false;
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.desktopManager.pantheon.extraWingpanelIndicators = with pkgs; [ wingpanel-indicator-ayatana ];
  services.xserver.desktopManager.pantheon.extraSwitchboardPlugs = [];
  environment.pantheon.excludePackages = [ pkgs.pantheon.epiphany pkgs.pantheon.elementary-mail ];
  environment.systemPackages = with pkgs; [ indicator-application-gtk3 ];
  programs.pantheon-tweaks.enable = true;
  
  # App indicator
  # - https://github.com/NixOS/nixpkgs/issues/144045#issuecomment-992487775
  systemd.user.services.indicatorapp = {
    description = "indicator-application-gtk3";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.indicator-application-gtk3}/libexec/indicator-application/indicator-application-service";
    };
  };
}
