{ config, lib, pkgs, ... }:
{
  environment.systemPackages =  with pkgs; [
    # Driver
    libvdpau-va-gl
    vaapiVdpau
    intel-media-driver
    intel-ocl
    intel-vaapi-driver
    mesa
    libinput

    # System tools
    gnumake
    lm_sensors
    bluetooth_battery
    betterdiscordctl
    killall
    unar
    tree
    libglibutil
    glib
    linux-router
    linuxPackages.cpupower
    throttled
    thermald
    haveged
    hdparm
    htop
    sdparm
    speedtest-cli
    macchanger
    wget
    neofetch
    pulseaudioFull
    lsof
    gitFull
    glxinfo
    speechd
    freetype
    lshw
    pciutils
    android-tools
    android-udev-rules
    gtk_engines
    gtk-engine-murrine
    sassc
    libsass
    inxi
    xorg.xrandr
    xorg.libXrandr
    xorg.xf86inputjoystick
    smartmontools
    gnupg
    pinentry-qt
    usbutils
    dbus
    acpi
    libva-utils
    ansible
    binutils
    btrfs-progs
    cachix
    pwgen
    openssl
    jq
    nix-bash-completions
    nix-prefetch-github
    nix-prefetch-scripts
    duf
    powertop
    iw

    # Language
    (python311.withPackages(ps: with ps; [ dbus-python numpy requests toolz ]))

    # Utilities
    google-chrome
    microsoft-edge
    discord
    spotify
    zoom-us
    virt-viewer
    teams-for-linux
    wpsoffice
    vscode
    xboxdrv
    scrcpy

    # Cybersecurity tools
    burpsuite
    nmap
    dirb
    whatweb
    hping
    sqlmap
    nikto

    # Theme
    amber-theme
 ];
}
