{ inputs, lib, ... }:
let
  polyModule =
    { pkgs, ... }:
    {
      stylix = lib.mkDefault {
        base16scheme = pkgs.base16-schemes + /share/themes/catppuccin-macchiato.yaml;
        polarity = "dark";
      };
    };
in
{
  flake.modules = {
    nixos.base = polyModule;
    homeManager.workstation = polyModule;
    # nixOnDroid.base = polyModule;
  };
}
