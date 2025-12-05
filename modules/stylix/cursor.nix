{ ... }:
let
  module' = attrs@{pkgs, ...}: {
    stylix.cursor = {
      package = pkgs.bibata-cursors-translucent;
      name = "Bibata-Modern-Ice";
      size = 22;
    };

    
    environment = {
      systemPackages = [attrs.config.stylix.cursor.package];
      variables = {
        HYPRCURSOR_THEME = "Bibata-modern";
        HYPRCURSOR_SIZE = attrs.config.stylix.cursor.size;
      };
    };
  };
in
{
  flake.modules={
    nixos.base = module';
  };
}
