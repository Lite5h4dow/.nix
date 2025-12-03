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
    nixos.wsl.stylix.autoEnable = false;

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
