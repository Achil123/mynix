{ pkgs, lib, ... }:

{
  boot.kernelPackages = let
    linux_custom_pkg = { fetchFromGitHub, buildLinux, ... } @ args:
      buildLinux (args // rec {
        version = "6.6";
        modDirVersion = "6.6.0-pf2";

        src = fetchFromGitHub {
          owner = "ckolivas";
          repo = "linux";
          rev = "v${version}";
          sha256 = "sha256-Y5XxTSIdppi04jtf6hk/gYFyiuABOBKHx563wkXQjQ=";
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
