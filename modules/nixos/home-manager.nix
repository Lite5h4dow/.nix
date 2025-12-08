{ config, inputs, ... }:
let
  username = config.flake.meta.user.name;
in
{
  flake.modules.nixos = {
    base = args: {
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

    ui = {
      home-manager.users.${username}.imports = [
        config.flake.modules.homeManager.ui
      ];
    };

    cad = {
      home-manager.users.${username}.imports = [
        config.flake.modules.homeManager.cad
      ];
    };

    dev = {
      home-manager.users.${username}.imports = [
        config.flake.modules.homeManager.dev
      ];
    };

    dev-extras = {
      home-manager.users.${username}.imports = [
        config.flake.modules.homeManager.dev-extras
      ];
    };

    gaming = {
      home-manager.users.${username}.imports = [
        config.flake.modules.homeManager.gaming
      ];
    };

    gamesdev = {
      home-manager.users.${username}.imports = [
        config.flake.modules.homeManager.gamesdev
      ];
    };
  };
}
