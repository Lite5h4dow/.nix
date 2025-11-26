{inputs, lib, ...}:
{
  flake.modules = {
    nixos.base = {
      imports = [ inputs.stylix.nixosModules.stylix ];
      stylix = {
        enable = true;
        homeManagerIntegration.autoImport = false;
      };
    };

    homeManager.workstation = {
      imports = [ inputs.stylix.homeModules.stylix ];
      stylix.enable = true;
    };

    # nixOnDroid.base = {
    #   imports = [ inputs.stylix.nixOnDroidModules.stylix ];
    #   stylix.enable = true;
    # };
  };
}
