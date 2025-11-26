{
  flake.modules.home.stylix =
    { pkgs, ... }:
    {
      home-manager.config.stylix.icons =

        pkgs.catppuccin-papirus-folders.override {
          flavor = "macchiato";
          accent = "teal";
        };
    };
}
