{ ... }:
{
  flake.modules.nixos.virtualisation = { ... }:
  {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
  };
}
