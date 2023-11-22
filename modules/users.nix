{ config, lib, pkgs, ... }:
{
  users.users.faaiq = {
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    isNormalUser = true;
    description = "faaiq";
    extraGroups = [ "networkmanager" "wheel" "audio" "vboxsf" "vboxusers" "video" "input" "adbusers" "kvm" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };
}
