{ config, inputs, ... }:
{
  flake.modules.nixos.base = args: {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs.hasGlobalPkgs = true;
      users.${config.flake.meta.user.name} = {
        home.stateVersion = args.config.system.stateVersion;
        imports = [ config.flake.modules.homeManager.base ];
      };
    };
  };
}
