{ ... }:
{
  flake.modules.homeManager ={
    gamesdev = { pkgs, ... }:
  {
    home.packages = with pkgs; [
      godot
      pureref
    ];
  };
    extras = { ... }:
    {
      progams.blender = {
        enable = true;
      };
    };
  };
}
