{ lib, ... }:
let
  inherit (lib) mkDefault;
  module' = {
    networking = {
      useDHCP = mkDefault true;
      resolvconf = {
        enable = mkDefault true;
        dnsSingleRequest = mkDefault false;
      };
      dhcpcd = {
        enable = mkDefault true;
      };
      networkmanager = {
        enable = mkDefault true;
        dhcp = mkDefault "dhcpcd";
        dns = mkDefault "systemd-resoved";
      };
    };
    
  };
in
{
  flake.modules.nixos.base = module';
}
