{ lib, ... }:
let
  inherit (lib) mkDefault;
  module' = {
    networking = {
      wireless.iwd = {
        enable = mkDefault true;
        settings = {
          Network = {
            EnableIPv6 = mkDefault true;
          };
          Settings = {
            AutoConnect = mkDefault true;
          };
        };
      };
      networkmanager = {
        wifi.backend = "iwd";
      };
    };
  };
in
{
  flake.modules.nixos.wireless = module';
}
