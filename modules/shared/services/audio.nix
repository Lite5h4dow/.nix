{ lib, ... }:
let
  inherit (lib) mkDefault;
  module' = {
    services={
      playerctld.enable = true;
      pulseaudio.enable = false;
      pipewire = {
        enable = mkDefault true;
        audio = {
          enable = mkDefault true;
        };
        alsa = {
          enable = mkDefault true;
          support32Bit = mkDefault true;
        };
        pulse = {
          enable = mkDefault true;
        };
        wireplumber = {
          enable = mkDefault true;
        };
        jack = {
          enable = mkDefault true;
        };
        systemWide = mkDefault true;
      };
    };
    security.rtkit.enable = true;
  };
in
{
  flake.modules.nixos.audio = module';
}
