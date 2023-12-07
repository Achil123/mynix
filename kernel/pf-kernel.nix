{ pkgs, lib, ... }:

{
  boot.kernelPackages = let
    linux_custom_pkg = { fetchurl, buildLinux, ... } @ args:
      buildLinux (args // rec {
        version = "6.6";
        modDirVersion = "6.6.0-pf2";

        src = fetchurl {
          url = "https://codeberg.org/pf-kernel/linux/archive/v6.6-pf2.tar.gz";
          sha256 = "sha256-Y5XxTSIdppiw04jtf6hk/gYFyiuABOBKHx563wkXQjQ=";
        };
        kernelPatches = [];

        extraConfig = ''
        '';

        extraMeta.branch = "6.6-pf2";
      } // (args.argsOverride or {}));
    linux_custom = pkgs.callPackage linux_custom_pkg{};
  in
    pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_custom);
}
