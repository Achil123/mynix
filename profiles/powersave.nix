{ config, lib, pkgs, ... }:

{
  #boot = {
  #  kernelParams = [ "pcie_aspm.policy=powersave" ];
  #  # blacklistedKernelModules = [ "uvcvideo" ];
  #  extraModprobeConfig = ''
  #    options snd_hda_intel power_save=1
  #    options iwlwifi power_save=1 d0i3_disable=0 uapsd_disable=0
  #    options iwldvm force_cam=0
  #  '';
  #  kernel.sysctl = {
  #    "kernel.nmi_watchdog" = 0;
  #    "vm.dirty_writeback_centisecs" = 6000;
  #    "vm.laptop_mode" = 5;
  #  };
  #};

  powerManagement = {
    enable = true;
    scsiLinkPolicy = "medium_power";
    powertop.enable = true;
    cpuFreqGovernor = "powersave";
  };
  services.upower.enable = true;
}
