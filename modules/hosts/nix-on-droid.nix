{
  config,
  inputs,
  lib,
  ...
}:
{
  flake.nixOnDroidConfigurations = {
    "base" = inputs.nix-on-droid.lib.nixOnDroidConfiguration {
      # pkgs = import inputs.nixpkgs { system = "aarch64-linux"; };
      modules = [
        config.flake.modules.nixOnDroid.base
        {system.stateVersion = "24.05"; }
      ];
    };
  };
}
