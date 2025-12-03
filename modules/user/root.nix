{ ... }:
let

  module' = {
    users.users."root" = {
      initialPassword = "toor";
    };
  };
in
{
  flake.modules.nixos.base = module';
}
