{ ... }:
let
  module'={
    programs.nh = {
      enable = true;
      clean={
        dates = "weekly";
        extraArgs = "--keep-since 14d --keep 5";
        flake = "git+https://github.com/Lite5h4dow/.nix";
      };
    };
  };
in
{
  flake.modules = {
    nixos.base = module';
  };
}
