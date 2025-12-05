{ ... }:
{
  flake.modules.homeManager.ui = {
    wayland.windowManager.hyprland.settings = {
      device = [
        {
          name = "razer-razer-blade-keyboard";
          kb_options = "caps:swapescape";
        }
      ];
    };
  };
}
