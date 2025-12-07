{ lib, ... }:
let
  module' = {
    hardware.cpu.amd = {
      updateMicrocode = lib.mkDefault true;
    };
  };
in
{
  flake.modules.nixos.cpu-amd = module';
}
