{
  config,
  inputs,
  lib,
  ...
}:
{
  flake.nixOnDroidConfigurations = {
    "base" = inputs.nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import inputs.nixpkgs { system = "aarch64-linux"; };
      modules = [ config.flake.module.nixOnDroid.base ];
    };
  };
}
