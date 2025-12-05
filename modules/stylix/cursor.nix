{ ... }:
let
  module' = {pkgs, ...}: {
    stylix.cursor = {
      package = pkgs.bibata-cursors-translucent;
      name = "Bibata-Modern-Ice";
      size = 22;
    };
  };
in
{
  flake.modules={
    nixos.base = module';
  };
}
