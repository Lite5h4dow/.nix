{ inputs, ... }:
{
  config.flake.modules.homeManager.gaming = {pkgs, ...}:
  let
    inherit (pkgs.stdenv.hostPlatform) system;
  in
  {
    home.packages = [
      inputs.polymc.packages.${system}.default
    ];
  };
}
