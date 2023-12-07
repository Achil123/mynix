{ config, lib, pkgs, ... }:
{
  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
    fontconfig.cache32Bit = true;
    fontconfig.subpixel.rgba = "rgb";
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FantasqueSansMono" "FiraMono" "FiraCode" "Mononoki" ]; })
      comic-relief
      corefonts
      dejavu_fonts
      emojione
      font-awesome_4
      iosevka
      noto-fonts
      noto-fonts-color-emoji
      powerline-fonts
      roboto
      terminus_font
      ubuntu_font_family
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
