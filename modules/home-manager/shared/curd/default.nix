{inputs,  ... }:
{
  flake.modules = {
    homeManager.base = { pkgs, ...}:let
      inherit (pkgs.stdenv.hostPlatform) system;
      in{
      home.packages = [
        inputs.curd.packages.${system}.default
      ];
    };
  };
}
