{lib, ...}:
let
  module' = {
    hardware.cpu.intel = {
      updateMicrocode = lib.mkDefault true;
    };
  };
in
{
  flake.modules.nixos.cpu-intel = module';
}
