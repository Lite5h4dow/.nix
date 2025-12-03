{
  config,
  inputs,
  lib,
  ...
}:
{
  flake.nixOnDroidConfigurations = {
    "base" = inputs.nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import inputs.nixpkgs {
        stdenv.hostPlatform.system = "aarch64-linux";
        overlays = [inputs.nix-on-droid.overlays.default];
      };
      home-manager-path = inputs.home-manager.outPath;
      modules = [
        config.flake.modules.nixOnDroid.base
        {system.stateVersion = "24.05"; }
      ];
    };
  };
}
