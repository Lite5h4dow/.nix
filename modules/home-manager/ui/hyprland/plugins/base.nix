{ ... }:
{
  flake.modules = {
    homeManager.ui =
      { pkgs, ... }:
      {
        wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
          # xtra-dispatchers
          # hyprtrails
          # hyprbars
          # hyprfocus
          # hypr-dynamic-cursors
          hyprspace
          hyprgrass
        ];
      };
  };
}
