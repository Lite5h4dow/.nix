{ ... }:
{
  flake.modules.nixos.base = {
    services.acpid.enable = true;
  };
}
