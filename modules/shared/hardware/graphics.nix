{ ... }:
let
  module' =
    { pkgs, ... }:
    {
      hardware.graphics.extraPackages = with pkgs; [
        intel-media-driver
        intel-ocl
        intel-vaapi-driver
      ];
    };
in
{
  flake.modules = {
    nixos.graphics = module';
  };
}
