{ ... }:
let
  module' = {
    networking = {
      useDHCP = true;
      enableIPv6 = true;
      resolvconf.enable = false;
    };

    services.resolved.enable = true;
    
  };
in
{
  flake.modules.nixos.base = module';
}
