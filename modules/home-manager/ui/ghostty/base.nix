{ lib, ... }:
{
  flake.modules.homeManager.ui = { pkgs, ... }:{
    programs.ghostty = {
      enable = true;
      package = pkgs.ghostty;
      settings = {
        keybind = [
          "ctrl+h=goto_split:left"
          "ctrl+j=goto_split:down"
          "ctrl+k=goto_split:up"
          "ctrl+l=goto_split:right"

          "ctrl+shift+h=new_split:left"
          "ctrl+shift+j=new_split:down"
          "ctrl+shift+k=new_split:up"
          "ctrl+shift+l=new_split:right"

          "ctrl+alt+h=resize_split:left,10"
          "ctrl+alt+j=resize_split:down,10"
          "ctrl+alt+k=resize_split:up,10"
          "ctrl+alt+l=resize_split:right,10"

          "ctrl+tab=next_tab"
          "ctrl+shift+tab=previous_tab"
          "ctrl+w=close_tab:this"
          "ctrl+t=new_tab"
        ];
      };
    };
    wayland.windowManager.hyprland.settings.bind = [
      "super, return, exec, ${lib.getExe pkgs.ghostty}"
    ];
  };
}
