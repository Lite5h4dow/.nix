{ ... }:
let
  module' = {
    networking = {
      enableIPv6 = true;
      resolvconf.enable = false;
      dhcpcd.enable = true;
      networkmanager = {
        enable = true;
        dns = "systemd-resolved";
        dhcp = "dhcpcd";
      };
    };

    services.resolved.enable = true;
    
  };
in
{
  flake.modules.nixos.base = module';
}
