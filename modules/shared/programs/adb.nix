{ config, ... }:
let
  module' = {
    programs.adb={
      enable = true;
    };
    users.users.${config.flake.meta.user.name}.extraGroups = [ "adbusers" ];
  };
in
{
  flake.modules = {
    nixos.dev = module';
    nixOnDroid.dev = module';
  };
}
