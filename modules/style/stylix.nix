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
    nixos.base = module';

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
