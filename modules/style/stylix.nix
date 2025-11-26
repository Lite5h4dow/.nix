{inputs, lib, ...}:
{
  flake.modules = {
    nixos.workstation = {
      imports = [ inputs.stylix.nixosModules.stylix ];
      stylix = {
        enable = true;
        homeManagerIntegration.autoImport = false;
      };
    };

    homeManager.base= {
      imports = [ inputs.stylix.homeModules.stylix ];
      stylix.enable = true;
    };

    nixOnDroid.base = {
      imports = [ inputs.stylix.nixOnDroidModules.stylix ];
      stylix = {
        enable = true;
        homeManagerIntegration.autoImport = false;
      };
    };
  };
}
