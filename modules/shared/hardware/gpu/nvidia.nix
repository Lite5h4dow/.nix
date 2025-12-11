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
    services = {
      xserver.videoDrivers = [ "nvidia" ];
      ollama = {
        acceleration = "cuda";
      };
    };

    nix.settings = {
      substituters = [ "https://cache.nixos-cuda.org" ];
      trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];
    };
  };
in
{
  flake = {
    modules.nixos.gpu-nvidia = module';
  };
}
