{
  flake.modules.homeManager.base.programs.fish = {
    enable = true;
  };
  flake.modules.nixOnDroid.base.environment = {pkgs,...}:{
    packages = with pkgs;[
      ncurses
    ];
  };
}
