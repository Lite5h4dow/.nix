{ lib, ... }:
{
  flake.modules.nixos.boot = {pkgs, ...}:{
    boot = {
      tmp.useTmpfs = lib.mkDefault true;
      loader.limine = {
        enable = lib.mkDefault true;
      };

      kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    };
  };
}
