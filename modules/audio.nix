{ config, lib, pkgs, ... }:
{
  hardware = {
    pulseaudio.package = pkgs.pulseaudioFull;
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
    pulseaudio.extraConfig = "load-module module-combine-sink";
    pulseaudio.daemon.config = {
      flat-volumes = "no";
    };
    bluetooth.enable = true;
  }; 

  # Enable sound with pipewire.
  #security.rtkit.enable = true;
  #services.pipewire = {
  #  enable = true;
  #  package = pkgs.pipewire;
  #  alsa.enable = true;
  #  alsa.support32Bit = true;
  #  pulse.enable = true;
  #  wireplumber.enable = true;
  #  # If you want to use JACK applications, uncomment this
  #  #jack.enable = true;

  #  # use the example session manager (no others are packaged yet so this is enabled by default,
  #  # no need to redefine it in your config for now)
  #  media-session.enable = true;
  #};
}
