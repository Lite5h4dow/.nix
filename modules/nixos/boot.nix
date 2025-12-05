{ lib, ... }:
{
  flake.modules.nixos = {
    boot = {pkgs, ...}:
    {
      boot = {
        tmp.useTmpfs = lib.mkDefault true;
        loader.limine = {
          enable = lib.mkDefault true;
        };

        kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
      };
    };

    virtualisation = {
      boot.binfmt.emulatedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "riscv64-linux"
      ];
    };
  };
}
