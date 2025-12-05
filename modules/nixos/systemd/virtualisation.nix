{ ... }:
{
  flake.modules.nixos.virtualisation = { pkgs, ... }:
  {
    systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];
  };
}
