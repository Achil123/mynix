{ pkgs, lib, ... }:

{
  boot.kernelPackages = let
    linux_custom_pkg = { fetchurl, buildLinux, ... } @ args:
      buildLinux (args // rec {
        version = "6.6";
        modDirVersion = "6.6.0";

        src = fetchurl {
          url = "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-6.6.tar.gz";
          sha256 = "sha256-Y5XxTSIdppiw04jtf6hk/gYFyiuABOBKHx563wkXQjQ=";
        };
        kernelPatches = [];

        extraConfig = ''
        '';

        extraMeta.branch = "6.6";
      } // (args.argsOverride or {}));
    linux_custom = pkgs.callPackage linux_custom_pkg{};
  in
    pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_custom);
}
