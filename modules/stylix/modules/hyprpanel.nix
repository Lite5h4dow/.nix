{ ... }:
{
  flake.modules.homeManager.ui = { config, ... }:
  let
    inherit (config.stylix.fonts) sansSerif sizes;
  in
  {
     programs.hyprpanel.settings.theme.font = {
       name = sansSerif.name;
       size = "${toString sizes.desktop}px";
     };
  };
}
