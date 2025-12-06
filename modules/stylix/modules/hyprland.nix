{ lib, ... }:
{
  flake.modules.homeManager.ui = {config, ...}:
  let
    inherit (config.lib.stylix) colors;
  in
  {
    wayland.windowManager.hyprland.settings = {
      general ={
        "col.active_border" = lib.mkForce "rgba(${colors.base0D}88)";
        "col.inactive_border" = lib.mkForce "rgba(${colors.base03}88)";
      };
      group = {
        "col.active_border" = lib.mkForce "rgba(${colors.base0D}88)";
        "col.inactive_border" = lib.mkForce "rgba(${colors.base03}88)";
        groupbar = {
          "col.active" = lib.mkForce "rgba(${colors.base0D}88)";
          "col.inactive" = lib.mkForce "rgba(${colors.base03}88)";
        };
      };
    };
  };
}
