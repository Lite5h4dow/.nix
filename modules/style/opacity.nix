{ lib, ... }:
let
  polyModule = {
    stylix.opacity = lib.genAttrs [ "applications" "desktop" "popups" "terminal" ] (n: 0.85);
  };
in
{
  flake.modules = {
    nixos.base = polyModule;
    homeManager.style = polyModule;
    # nixOnDroid.base = polyModule;
  };
}
