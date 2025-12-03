{config, ...}:
{
  flake.modules.nixos.base = args: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs.hasGlobalPkgs = true;
      config = {
        home.stateVersion = args.config.system.stateVersion;
        imports = [config.flake.modules.homeManager.base];
      };
    };
  };
}
