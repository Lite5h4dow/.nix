{
  flake.modules.homeManager.cad = {pkgs, ...}:
  {
    home.packages = with pkgs; [
      kicad
      freecad
      prusa-slicer
    ];
  }
}
