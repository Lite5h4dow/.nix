{ ... }:
{
  flake.modules.nixos.ui= {
    programs.geary.enable = true;
  };
}
