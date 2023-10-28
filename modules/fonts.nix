{ config, lib, pkgs, ... }:
{
  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "DroidSansMono" "RobotoMono" "Tinos" "Mononoki" ]; })
      emojione
      fira
      fira-code
      fira-mono
      iosevka
      terminus_font
      anonymousPro
      corefonts
      inconsolata
      ubuntu_font_family
      ttf_bitstream_vera
      comic-relief
      font-awesome_4
      vistafonts
    ];
  };
} 
