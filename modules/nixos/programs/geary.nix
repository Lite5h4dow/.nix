{ ... }:
{
  flake.modules.nixos.base = {
    programs.geary.enable = true;
  };
}
