{ ... }:
let
  module'={
    programs.nh = {
      enable = true;
      clean={
        dates = "weekly";
        
      };
    };
  };
in
{
  flake.modules = {
    nixos.base = module';
  };
}
