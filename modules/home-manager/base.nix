{ lib, config, ... }:
{
  flake.modules.homeManager.base = args: {
    home = {
      username = lib.mkDefault config.flake.meta.user.name;
      homeDirectory = lib.mkDefault "/home/${config.flake.meta.user.name}";
      sessionVariables = {
        EDITOR = "hx";
      };
    };
    programs.home-manager.enable = true;
  };
}
