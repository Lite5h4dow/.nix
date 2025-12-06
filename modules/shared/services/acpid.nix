{ ... }:
{
  flake.modules.nixos.base = {
    services = {
      acpid.enable = true;
      upower.enable = true;
    };
  };
}
