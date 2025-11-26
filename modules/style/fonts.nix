{ lib, ...}:
let
  polyModule = polyArgs@{pkgs, ...}:{
    stylix.fonts = {

      sansSerif = lib.mkDefault {
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

    fonts.fontconfig.enable = true;
  };
in
{
  
  nixos.base = polyModule;
  nixOnDroid.base = polyModule;
}
