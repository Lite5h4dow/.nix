{ lib, ... }:
{
  flake.modules.homeModules.ui =
    { pkgs, ... }:
    {
      programs.rofi = {
        enable = true;
        package = pkgs.rofi;
      };

      wayland.windowManager.hyprland.settings = {
        bindr = [
          "SUPER, SUPER_L, exec, pkill rofi || ${lib.getExe pkgs.rofi} -show drun -show-icons"
        ];
      };
    };
}
