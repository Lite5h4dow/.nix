{ inputs, lib, ... }:
{
  flake.modules = {
    homeManager.style = {
      imports = [
        inputs.stylix.homeModules.stylix
      ];
      stylix.enable = true;
        homeManagerIntegration.autoImport = false;
    };
    nixos.base = {
      imports = [
        inputs.stylix.nixosModules.stylix
        inputs.stylix.homeModules.stylix
      ];
      stylix = {
        enable = true;
        # homeManagerIntegration.autoImport = false;
      };
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
