{ lib, ... }:
let
  inherit (lib) mkDefault;
  module' = {
    services.pipewire = {
      enable = mkDefault true;
      audio = {
        enable = mkDefault true;
      };
      alsa = {
        enable = mkDefault true;
        support32bit = mkDefault true;
      };
      pulse = {
        enable = mkDefault true;
      };
      jack = {
        enable = mkDefault true;
      };
      systemWide = mkDefault true;
    };
  };
in
{
  flake.modules.nixos.audio = module';
}
