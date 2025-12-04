{ ... }:
let
  module' = {
    services.xserver.videoDrivers = [ "modesetting" ];
  };
in
{
  flake.modules.nixos.gpu-intel = module';
}
