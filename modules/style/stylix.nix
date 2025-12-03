{ inputs, lib, ... }:
{
  flake.modules = {
    homeManager.style = {
      imports = [
        inputs.stylix.homeModules.stylix
      ];
      stylix.enable = true;

    };
    nixos.base = {
      imports = [
        inputs.stylix.nixosModules.stylix
      ];
      stylix = {
        enable = true;
        homeManagerIntegration.autoImport = false;
      };
    };
    nixos.wsl = {
      stylix.targets.gnome.enable = false;
    };

    # nixOnDroid.base = {
    #   imports = [
    #     inputs.stylix.nixOnDroidModules.stylix
    #     inputs.stylix.homeModules.stylix
    #   ];
    #   stylix = {
    #     enable = true;
    #     homeManagerIntegration.autoImport = false;
    #   };
    # };
  };
}
