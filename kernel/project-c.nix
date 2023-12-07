{ pkgs, lib, ... }:

{
  boot.kernelPackages = let
    linux_custom_pkg = { fetchurl, buildLinux, ... } @ args:
      buildLinux (args // rec {
        version = "6.5";
        modDirVersion = "6.5";

        src = fetchurl {
          url = "https://gitlab.com/alfredchen/linux-prjc/-/archive/v6.5-prjc-r0/linux-prjc-v6.5-prjc-r0.tar.gz";
          sha256 = "sha256-Y5XxTSIdppiw04jtf6hk/gYFyiuABOBKHx563wkXQjQ=";
        };
        kernelPatches = [];

        extraConfig = ''
        '';

        extraMeta.branch = "6.5-prjc-r0";
      } // (args.argsOverride or {}));
    linux_custom = pkgs.callPackage linux_custom_pkg{};
  in
    pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_custom);
}
