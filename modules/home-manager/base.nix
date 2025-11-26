{ lib, config, ... }:
{
  flake.modules.homeManager.base = args: {
    home = {
      username = lib.mkDefault config.flake.meta.username;
      homeDirectory = lib.mkDefault "/home/${config.flake.meta.username}";
    };
    programs.home-manager.enable = true;
  };
}
