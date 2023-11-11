{ pkgs, lib, ... }:

{
  boot.kernelPackages = let
      linux_stable_pkg = { fetchurl, buildLinux, ... } @ args:

        buildLinux (args // rec {
          version = "6.5.10";
          modDirVersion = version;

          src = fetchurl {
            url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.5.10.tar.xz";
            sha256 = "oV9JhgSt+PashC8XM6aUCD8j5Xi0jI6X2UttiWjlWos=";
          };
          kernelPatches = [];

          extraConfig = ''
            INTEL_SGX y
          '';

          extraMeta.branch = "6.5";
        } // (args.argsOverride or {}));
      linux_stable = pkgs.callPackage linux_stable_pkg{};
    in 
      pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_stable);
}
