{ inputs, lib, ... }:
{
  flake.modules = {
    nixos.ui =
      { pkgs, ... }:
      let
        inherit (inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system})
          hyprland
          xdg-desktop-portal-hyprland
          ;
      in
      {
        programs.hyprland = {
          enable = true;
          package = hyprland;
          portalPackage = xdg-desktop-portal-hyprland;
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

        nix.settings = {
          substituters = ["https://hyprland.cachix.org"];
          trusted-substituters = ["https://hyprland.cachix.org"];
          trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
        };
    };
  };
}
