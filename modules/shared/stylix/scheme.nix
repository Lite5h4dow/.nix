{
  flake.modules.home.stylix = { pkgs, ... }: {
    home-manager.config.stylix.scheme = pkgs.base16-schemes + /share/themes/catppuccin-macchiato.yaml;
  };
}
