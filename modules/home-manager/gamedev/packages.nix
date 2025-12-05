{ ... }:
{
  flake.modules.homeManager.gamesdev = { pkgs, ... }:
  {
    home.packages = with pkgs; [
      godot
    ];
  };
}
