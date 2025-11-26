{ config, ... }:
{
  flake.modules.homeManager.base = args: {
    home = {
      username = config.flake.meta.username;
      homeDirectory = "/home/${config.flake.meta.username}";
    };
    programs.home-manager.enable = true;
  };
}
