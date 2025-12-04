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
      networkManager = {
        wifi.backend = mkDefault "iwd";
      };
    };
  };
in
{
  flake.modules.nixos.wireless = module';
}
