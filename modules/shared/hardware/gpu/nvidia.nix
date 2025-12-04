{ lib, config, ... }:
let
  inherit (lib) mkDefault;
  module' = {
    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      open = false;

      videoAcceleration = mkDefault true;
      nvidiaSettings = mkDefault true;

      dynamicBoost.enable = mkDefault true;
      powerManagement.enable = mkDefault false;
    };
    services.xserver.videoDrivers = [ "nvidia" ];
  };
in
{
  flake.modules.nixos.gpu-nvidia = module';
}
