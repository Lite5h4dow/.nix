{ ... }:
let
  module' = { ... }:
  {
    hardware.sensor.iio = {
      enable = true;
    };
  };
in
{
  flake.modules.nixos = {
    sensors = module';
    touchscreen = module';
  };
}
