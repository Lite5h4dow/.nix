{ inputs, ... }:
{
  flake.modules.homeManager.ui = {
    imports = [inputs.nixcord.homeModules.nixcord];
    programs.nixcord = {
      enable = true;
      config = {
      };
    };
  };
}
