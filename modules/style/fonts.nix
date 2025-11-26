{ lib, ... }:
let
  polyModule =
    polyArgs@{ pkgs, ... }:
    {
      stylix.fonts = lib.mkDefault {

        sansSerif = lib.mkDefault {
          package = pkgs.nerd-fonts.fira-code;
          name = "FiraCode Nerd Font";
        };

        serif = lib.mkDefault polyArgs.config.stylix.fonts.sansSerif;

        monospace = lib.mkDefault {
          package = pkgs.nerd-fonts.fira-mono;
          name = "FiraCode Nerd Font Mono";
        };

        emoji = lib.mkDefault {
          package = pkgs.google-fonts;
          name = "Noto Color Emoji";
        };

        sizes = {
          applications = 12;
          desktop = 12;
          popups = 12;
          terminal = 12;
        };
      };

    };
in
{
  flake.modules = {
    nixos.base = polyModule;
    # nixOnDroid.base = polyModule;
  };
}
