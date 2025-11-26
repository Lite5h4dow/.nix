{
  flake.modules.home.stylix = { pkgs, ... }:{
      home-manager.config.stylix.cursor =
        {
          package = pkgs.bibata-cursors-translucent;
          name = "Bibata-Modern-Ice";
          size = 22;
        };
    };
}
