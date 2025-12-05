{ ... }:
{
  flake.modules.homeManager.ui = {config, ...}:
  let
    inherit (config.lib.stylix) colors;
  in
  {
    wayland.windowManager.hyprland.settings = {
      general ={
        "col.active_border" = "rgba(${colors.base0D}88)";
        "col.inactive_border" = "rgba(${colors.base03}88)";
      };
    };
  };
}
