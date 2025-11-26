{
  config,
  inputs,
  lib,
  ...
}:
{
  flake.nixOnDroidConfigurations = lib.mapAttrs' (name: module: {
    inherit name;
    value = inputs.nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import inputs.nixpkgs { system = "aarch64-linux"; };
      modules = [ module ];
    };
  }) config.flake.modules.nixOnDroid or { };
}
