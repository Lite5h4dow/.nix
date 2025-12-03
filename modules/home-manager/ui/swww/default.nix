{ ... }:
{
  flake.modules = {
    homeModules.ui = {
      services.swww = {
        enable = true;
      };
    };
  };
}
