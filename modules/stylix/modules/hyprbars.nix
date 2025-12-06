{ ... }:
{
  flake.modules.homeManager.ui = { config, ... }:
  let
    inherit (config.lib.stylix) colors;
    inherit (config.stylix.fonts) sansSerif sizes;
  in
  {
    wayland.windowManager.hyprland.settings = {
      plugin.hyprbars = {
        "col.text" = "rgb(${colors.base05})";
        bar_text_font = sansSerif.name;
        bar_text_size = sizes.desktop;

        hyprbars-button = [
          "rgb(${colors.base08}), 12.5, , hyprctl dispatch killactive"
          "rgb(${colors.base0A}), 12.5, , hyprctl dispatch togglefloating"
          "rgb(${colors.base0B}), 12.5, , hyprctl dispatch fullscreen 1"
        ];
      };
      
      windowrulev2 = [
        "plugin:hyprbars:bar_color rgba(${colors.base0D}88),focus:1"
        "plugin:hyprbars:bar_color rgba(${colors.base03}88),focus:0"
        "plugin:hyprbars:nobar, group:*"

        # "plugin:hyprbars:title_color rgb(000000FF),focus:1"
        # "plugin:hyprbars:title_color rgb(111111FF),focus:0"
      ];
    };
  };
}
