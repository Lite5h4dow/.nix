{ inputs, lib, ...}:
let
  polyModule.stylix = {pkgs,...}:
  {
    base16scheme = pkgs.base16-schemes + /share/themes/catppuccin-macchiato.yaml;
    polarity = "dark";
  };
in
{
  flake.modules = {
    nixos.base = polyModule;
    homeManager.base = polyModule;
    nixOnDroid.base = polyModule;
  };
}
