{ lib, ... }:
let
  inherit (lib) mkDefault;
  module' = {
    hardware.nvidia = {
      open = false;

      videoAcceleration = mkDefault true;
      nvidiaSettings = mkDefault true;

      dynamicBoost.enable = mkDefault false;
      powerManagement.enable = mkDefault false;
    };
    services.xserver.videoDrivers = [ "nvidia" ];
  };
in
{
  flake.modules.nixos.gpu-nvidia = module';
}
