{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      top@{
        allSystems,
        config,
        withSystem,
        moduleWithSystem,
        ...
      }:
      {
        imports = [
          inputs.flake-parts.flakeModules.modules
        ];

        allSystems = {
          imports = [
            ./modules
            ./style
            ./config
          ];
        };

        withSystem = {
        };

        moduleWithSystem = {

        };

      }
    );
}
