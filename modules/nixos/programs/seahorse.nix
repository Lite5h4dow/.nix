{ ... }:
{
  flake.modules.nixos.base = {
    programs.seahorse.enable = true;
  };
}
