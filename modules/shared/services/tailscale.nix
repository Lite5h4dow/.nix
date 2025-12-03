{ ... }:
let
  module' = {
    services.tailscale = {
      enable = true;
      disableTaildrop = false;
    };
  };
in
{
  flake.modules = {
    nixos.base = module';
  };
}
