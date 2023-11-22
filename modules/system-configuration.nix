{ config, lib, pkgs, ... }:
{
  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.inputMethod.enabled = "ibus";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };

  # Backup Configuration
  system.copySystemConfiguration = true;

  # Hardware Configuration
  hardware = {
    acpilight.enable =true;
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
    cpu.amd.updateMicrocode = false;
    opengl.enable = true;
    opengl.driSupport32Bit = true;
    opengl.extraPackages = with pkgs; [ intel-media-driver intel-ocl intel-vaapi-driver libvdpau-va-gl vaapiVdpau vaapi-intel-hybrid libva1 mesa ];
    opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ intel-media-driver intel-vaapi-driver libvdpau-va-gl vaapiVdpau mesa ];
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  # Swap
  zramSwap.enable = true;

  # Nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "-d";
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-24.8.6"
    ];
  };

  # Firefox
  nixpkgs.config.firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
    enableAdobeFlashDRM = true;
    jre = false;
    icedtea = true;
  };

  programs.firefox.package = pkgs.firefox.override {
    cfg = {
      enablePlasmaBrowserIntegration = true;
    };
  };
  
  # gnupg
  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #  pinentryFlavor = "qt";
  #};

  #vim
  programs.vim = {
    defaultEditor = true;
    package = pkgs.vim-full;
  };

  # adb
  programs.adb.enable = true;
  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  # Thefuck
  programs.thefuck.enable = true;
  programs.thefuck.alias = "fuck";

  # vboxnetwork
  environment.etc."vbox/networks.conf".text = ''
    * 10.0.0.0/8 192.168.0.0/16 172.0.0.0/8
  '';
}
