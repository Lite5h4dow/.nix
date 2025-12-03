{ lib, ... }:
{
  flake.modules = {
    nixos.ui =
      { pkgs, ... }:
      {
        programs.hyprland = {
          enable = true;
        };

        xdg.portal = {
          enable = true;
          extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
          ];
          config.common = {
            "org.freedesktop.impl.portal.Screencast" = "hyprland";
            "org.freedesktop.impl.portal.Screenshot" = "hyprland";
            "org.freedesktop.impl.portal.Screenshot.PickColor" = lib.getExe pkgs.hyprpicker;
          };
        };
      };
  };
}
