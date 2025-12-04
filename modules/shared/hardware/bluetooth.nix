{ lib, ... }:
let
  inherit (lib) mkDefault;
  module' = {
    hardware.bluetooth = {
      enable = mkDefault true;
      hsphfpd.enable = mkDefault false;
      powerOnBoot = mkDefault true;
      settings = {
        AVDTP = {
          SessionMode = "ertm";
          StreamMode = "streaming";
        };
      };
    };
  };
in
{
  flake.modules.nixos.bluetooth = module';
}
