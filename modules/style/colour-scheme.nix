{ inputs, lib, ... }:
let
  scheme = {pkgs, ...}:pkgs.base16-schemes + /share/themes/catppuccin-macchiato.yaml;
  polyModule =
    {
      stylix = lib.mkDefault {
        base16Scheme = scheme;
        polarity = "dark";
      };
    };
in
{
  flake.modules = {
    nixos.base = polyModule;
    homeManager.workstation = polyModule;
    nixOnDroid.base = polyModule;
  };
}
