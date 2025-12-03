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
  fake.modules = {
    nixos.base = module';
  };
}
