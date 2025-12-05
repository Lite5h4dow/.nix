{ config, inputs, ... }:
let
  username = config.flake.meta.user.name;
in
{
  flake.modules = {
    nixos.base = args: {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs.hasGlobalPkgs = true;
        backupFileExtension = ".old";
        users.${username} = {
          home.stateVersion = args.config.system.stateVersion;
          imports = [ config.flake.modules.homeManager.base ];
        };
      };
    };

    nixos.ui = {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager = {
        users.${username}.imports = [
          config.flake.modules.homeManager.base
          config.flake.modules.homeManager.ui
        ];
      };
    };
  };
}
