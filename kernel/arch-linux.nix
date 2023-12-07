{ pkgs, lib, ... }:

{
  boot.kernelPackages = let
    linux_custom_pkg = { fetchurl, buildLinux, ... } @ args:
      buildLinux (args // rec {
        version = "6.6";
        modDirVersion = "6.6-arch1";

        src = fetchurl {
          url = "https://github.com/archlinux/linux/archive/refs/tags/v6.6-arch1.tar.gz";
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
