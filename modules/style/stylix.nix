{ inputs, lib, ... }:
let
  module' = {
    imports = [
      inputs.stylix.homeModules.stylix
    ];
    stylix.enable = true;
  };
in
{
  flake.modules = {
    homeManager.style = module';
    nixos.base = {
      imports = [
        module'
        inputs.stylix.nixosModules.stylix
      ];
      homeManagerIntegration.autoImport = false;
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
