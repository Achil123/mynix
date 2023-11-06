{ pkgs, lib, ... }:

{
  boot.kernelPackages = let
      linux_arch_pkg = { fetchurl, buildLinux, ... } @ args:

        buildLinux (args // rec {
          version = "6.5.9.arch2-1";
          modDirVersion = version;

          src = fetchurl {
            url = "https://europe.mirror.pkgbuild.com/core/os/x86_64/linux-6.5.9.arch2-1-x86_64.pkg.tar.zst";
          };
          kernelPatches = [];

          extraConfig = ''
            INTEL_SGX y
          '';

          extraMeta.branch = "6.5";
        } // (args.argsOverride or {}));
      linux_arch = pkgs.callPackage linux_arch_pkg{};
    in 
      pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_arch);
}
