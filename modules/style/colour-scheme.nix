{ inputs, lib, ... }:
let
  polyModule = {pkgs, ...}:
    {
      stylix = lib.mkDefault {
        base16Scheme = pkgs.base16-schemes + /share/themes/catppuccin-macchiato.yaml;
        polarity = "dark";
      };
    };
in
{
  flake.modules = {
    nixos.base = polyModule;
    homeManager.base = polyModule;
    nixOnDroid.base = polyModule;
  };
}
