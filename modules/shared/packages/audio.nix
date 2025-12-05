{ ... }:
let
  module' = { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      helvum
    ];
  }
in
{
  flake.modules.nixos.audio = module';
}
