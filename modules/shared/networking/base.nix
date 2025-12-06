{ ... }:
let
  module' = {
    networking = {
      enableIPv6 = true;
      resolvconf.enable = false;
      networkmanager = {
        enable = true;
        dns = "systemd-resolved";
      };
    };

    services.resolved.enable = true;
    
  };
in
{
  flake.modules.nixos.base = module';
}
