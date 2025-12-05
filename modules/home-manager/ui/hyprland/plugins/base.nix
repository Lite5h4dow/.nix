{ inputs, ... }:
{
  flake.modules = {
    homeManager.ui =
      { pkgs, ... }:
      let
        hypr-plugins = inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};
        hyprspace = inputs.hyprspace.packages.${pkgs.stdenv.hostPlatform.system}.Hyprspace;
        inherit (hypr-plugins) hyprbars hyprgrass;
      in
      {
        wayland.windowManager.hyprland.plugins = [
          # xtra-dispatchers
          # hyprtrails
          hyprbars
          # hyprfocus
          # hypr-dynamic-cursors
          hyprspace
          # hyprgrass
        ];
      };
  };
}
