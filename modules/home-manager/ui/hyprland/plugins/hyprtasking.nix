{
  flake.modules.homeManager.ui.wayland.windowManager.hyprland.settings = {
    bind =[
      "super, tab, hyprtasking:toggle, all"
    ];

    plugin.hyprtasking = {
      layout = "linear";
    };
  };
}
