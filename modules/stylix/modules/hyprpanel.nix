{ ... }:
{
  flake.modules.homeManager.ui = { config, ... }:
  let
    inherit (config.stylix.fonts) sansSerif sizes;
  in
  {
     programs.hyprpanel.theme.font = {
       name = sansSerif.name;
       size = "${sizes.desktop}px";
     };
  };
}
