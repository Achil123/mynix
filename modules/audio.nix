{ config, lib, pkgs, ... }:
{
  # Pulseaudio
  hardware = {
    pulseaudio.package = pkgs.pulseaudioFull;
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
    pulseaudio.extraConfig = ''
      load-module module-bluetooth-discover
      load-module module-switch-on-connect
      load-module module-filter-heuristics
      load-module module-filter-apply
    '';
    pulseaudio.daemon.config = {
      flat-volumes = "no";
    };
  };

  nixpkgs.config.pulseaudio = true;

  # Pipewire
  #sound.enable = true;
  #security.rtkit.enable = true;
  #services.pipewire = {
  #  enable = true;
  #  package = pkgs.pipewire;
  #  alsa.enable = true;
  #  alsa.support32Bit = true;
  #  pulse.enable = true;
  #  jack.enable = true;
  #  wireplumber.enable = true;
  #  media-session.enable = true;
  #};
}
