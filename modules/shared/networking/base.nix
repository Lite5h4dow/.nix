{ lib, ... }:
let
  inherit (lib) mkDefault;
  module' = {
    networking = {
      useDHCP = mkDefault true;
      enableIPv6 = mkDefault true;
    };

    services.resolved.enable = mkDefault true;
    
  };
in
{
  flake.modules.nixos.base = module';
}
