{ inputs, ... }:
{
  flake.modules = {
    homeManager.ui =
      { pkgs, ... }:
      let
        hyprspace = inputs.hyprspace.packages.${pkgs.stdenv.hostPlatform.system}.Hyprspace;
        smw = inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces;
        hypr-plugins = inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};
        inherit (hypr-plugins) hyprbars hyprtrails hyprfocus xtra-dispatchers;
      in
      {
        wayland.windowManager.hyprland.plugins = [
          # smw
          xtra-dispatchers
          # hyprtrails
          hyprbars
          hyprfocus
          # hypr-dynamic-cursors
          # hyprspace
          # hyprgrass
        ];
      };
  };
}
