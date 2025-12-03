{ ... }:
{
  flake.modules.homeManager.base = {
    programs.nh = {
      enable = true;
      # osFlake = "";
      # homeFlake = "";
      # darwinFlake = "";
    };
  };
}
