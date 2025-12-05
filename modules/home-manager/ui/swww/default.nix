{ ... }:
{
  flake.modules = {
    homeManager.ui = {
      services.swww = {
        enable = true;
      };
    };
  };
}
