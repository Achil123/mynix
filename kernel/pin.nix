{ pkgs, lib, ... }:

{
  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_1.override {
    argsOverride = rec {
      src = pkgs.fetchurl {
            url = "mirror://kernel/linux/kernel/v5.x/linux-${version}.tar.xz";
            sha256 = "sha256-vivuizRvPMs1h58WyAoyPt2lceNhkEA4BcFKnqJOSkc=";
      };
      version = "5.15.140";
      modDirVersion = "5.15.140";
      };
  });
}
