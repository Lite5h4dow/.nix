{ ... }:
{
  flake.modules.homeManager.ui = { config, ... }:
  let
    inherit (config.lib.stylix) colors;
  in
  {
    wayland.windowManager.hyprland.settings = {
      plugin.hyprtasking = {
        bg_color = "0x${colors.base00}ff";
      };
    };
  };
}
