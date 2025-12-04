{ inputs, config, ... }:
{
  flake.nixosConfigurations."laptop" = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      stdenv.hostPlatform.system = "x86_64-linux";
    };
    modules = with config.flake.modules.nixos; [
      base
      boot
      ui
    ];
  };
}
