{
  flake.modules.homeManager.ui.wayland.windowManager.hyprland.settings = {
    bind =[
      "super, tab, hyprtasking:toggle, all"
      ", escape, hyprtasking:if_active, hyprtasking:toggle cursor"
    ];

    gesture = [
      # "3, left, dispatcher, hyprtasking:move, right"
      # "3, right, dispatcher, hyprtasking:move, left"

      # "4, down, dispatcher, hyprtasking:if_active, hyprtasking:toggle cursor"
      # "4, up, dispatcher, hyprtasking:toggle, all"
    ];

    plugin.hyprtasking = {
      layout = "linear";
      gestures.enable = true;
      linear = {
        blur = false;
      };
    };
    
  };
}
