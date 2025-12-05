{ inputs, ... }:
let
  module' = { pkgs, ... }:
  let
    inherit (pkgs.stdenv.hostPlatform) system;
  in
  {
    programs.iio-hyprland = {
      enable = true;
      package = inputs.iio-hyprland.packages.${system}.default;
    };
  };
in
{
  flake.modules.nixos = {
    touchscreen = module';
  };
}
