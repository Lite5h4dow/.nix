{ ... }:
let
  module'={
    programs.nh = {
      enable = true;
      clean={
        dates = "weekly";
        extraArgs = "--keep-since 14d --keep 5";
      };
      flake = "git+https://git.litelot.us/litelotus/.nix.git";
    };
  };
in
{
  flake.modules = {
    nixos.base = module';
  };
}
