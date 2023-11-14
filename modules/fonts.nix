{ config, lib, pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
    fontconfig.cache32Bit = true;
    fontconfig.subpixel.rgba = "rgb";
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "DroidSansMono" "RobotoMono" "Tinos" "Mononoki" ]; })
      dejavu_fonts
      noto-fonts
      noto-fonts-color-emoji
      emojione
      fira
      fira-code
      gyre-fonts
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
    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        serif = [ "Noto Sans" "Ubuntu" ];
        sansSerif = [ "Noto Sans" "Ubuntu" ];
        monospace = [ "Fira Mono" "Ubuntu" ];
      };
    };
  };
} 
