# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./kernel/pin.nix
      ./modules/modulelist.nix
      #./profiles/powersave.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.grub.enable = true;
    loader.grub.device = "nodev";
    loader.grub.efiSupport = true;
    loader.grub.useOSProber = true;
    loader.efi.canTouchEfiVariables = true;
    loader.efi.efiSysMountPoint = "/boot";
    initrd.verbose = false;
    consoleLogLevel = 0;
    extraModulePackages = with config.boot.kernelPackages; [ virtualbox cpupower ];
    kernelParams = [
      "quiet"
      "splash"
      "vga=current"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
      "vm.swappiness" = 150;
      "vm.watermark_boost_factor" = 0;
      "vm.watermark_scale_factor" = 125;
      "vm.page-cluster" = 0;
      "vm.vfs_cache_pressure" = 100;
      "vm.dirty_background_ratio" = 10;
      "vm.dirty_ratio" = 20;
      "vm.dirty_writeback_centisecs" = 500;
      "vm.dirty_expire_centisecs" = 3000;
    };
  };

  system.stateVersion = "23.11";

}

