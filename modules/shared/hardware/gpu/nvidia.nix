{ lib, ... }:
let
  inherit (lib) mkDefault;
  module' = {
    hardware.nvidia = {
      enable = true;
      open = false;

      videoAcceleration = mkDefault true;
      nvidiaSettings = mkDefault true;

      dynamicBoost.enable = mkDefault true;
      powerManagement.enable = mkDefault false;
    };
  };
in
{
  flake.modules.nixos.gpu-nvidia = module';
}
