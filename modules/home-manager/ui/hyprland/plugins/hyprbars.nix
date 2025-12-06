{
  flake.modules.homeManager.ui.wayland.windowManager.hyprland.settings = {
    plugin.hyprbars ={
      enabled = true;
      bar_blur = true;
      bar_height = 25;
      bar_text_align = "center";
      bar_part_of_window = true;
      bar_precedence_over_border = true;
    };

    windowrule = [
      "plugin:hyprbars:nobar, match:group true"
    ];
  };
}
