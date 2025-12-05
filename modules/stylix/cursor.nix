{ ... }:
let
  module' = attrs@{pkgs, ...}: {
    stylix.cursor = {
      package = pkgs.bibata-cursors-translucent;
      name = "Bibata-Spirit";
      size = 22;
    };

    
    environment = {
      systemPackages = [attrs.config.stylix.cursor.package];
      variables = {
        HYPRCURSOR_THEME = "Bibata-spirit";
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
