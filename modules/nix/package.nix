{ lib, ... }:
let
  polyModule =
    { pkgs, ... }:
    {
      nix.package =lib.mkDefault (lib.flip lib.getAttr pkgs.nixVersions(lib.last(lib.naturalSort(lib.filter (lib.hasPrefix "nix_") (lib.attrNames(pkgs.nixVersions))))));
    };
in
{
  flake.modules = {
    nixos.base = polyModule;
    homeManager.base = polyModule;
    nixOnDroid.base = polyModule;
  };
}
