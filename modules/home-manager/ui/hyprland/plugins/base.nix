{ inputs, ... }:
{
  flake.modules = {
    homeManager.ui =
      { pkgs, ... }:
      let
        inherit (pkgs.stdenv.hostPlatform) system;
        hyprgrass = inputs.hyprgrass.packages.${system}.default;
        hyprtasking = inputs.hyprtasking.packages.${system}.hyprtasking;
        hdc = inputs.hypr-dynamic-cursors.packages.${system}.hypr-dynamic-cursors;
        smw = inputs.split-monitor-workspaces.packages.${system}.split-monitor-workspaces;

        hypr-plugins = inputs.hyprland-plugins.packages.${system};
        inherit (hypr-plugins)
          hyprbars
          hyprfocus
          hyprtrails
          xtra-dispatchers
          ;
      in
      {
        wayland.windowManager.hyprland.plugins = [
          smw
          hdc
          xtra-dispatchers
          # hyprtrails
          hyprbars
          hyprfocus
          hyprtasking
          # hyprgrass
        ];
      };
  };
}
