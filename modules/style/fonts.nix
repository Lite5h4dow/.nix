{ ... }:
let
  polyModule =
    polyArgs@{ pkgs, ... }:
    {
      stylix.fonts = {

        sansSerif = {
          package = pkgs.nerd-fonts.fira-code;
          name = "FiraCode Nerd Font";
        };

        serif = polyArgs.config.stylix.fonts.sansSerif;

        monospace = {
          package = pkgs.nerd-fonts.fira-mono;
          name = "FiraCode Nerd Font Mono";
        };

        emoji = {
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
    homeManager.style = polyModule;
    # nixOnDroid.base = polyModule;
  };
}
