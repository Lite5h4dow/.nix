{ lib, ... }:
let
  inherit (lib) mkDefault;
  module' = { pkgs, config, ... }:{
    config.flake.meta.cudaAvailable = true;
    hardware.nvidia = {
      open = false;

      videoAcceleration = mkDefault true;
      nvidiaSettings = mkDefault true;

      dynamicBoost.enable = mkDefault false;
      powerManagement.enable = mkDefault false;
    };
    services = {
      xserver.videoDrivers = [ "nvidia" ];
    };

    nix.settings = {
      substituters = [ "https://cache.nixos-cuda.org" ];
      trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];
    };
  };
in
{
  flake = {
    meta.cudaAvailable = mkDefault false;
    modules.nixos.gpu-nvidia = module';
  };
}
