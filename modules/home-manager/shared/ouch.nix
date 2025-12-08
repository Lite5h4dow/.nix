{
  flake.modules.homeModules.base = { pkgs, ... }:{
    home.packages = with pkgs; [ouch];
  };
}
