{
  flake.modules.nixOnDroid.base = {pkgs,...}:{
    environment.packages = with pkgs; [
      ncurses
      openssh
    ];
  };
}
