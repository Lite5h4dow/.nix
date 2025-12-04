{ inputs, config, ... }:
{
  flake.nixosConfigurations."laptop" = {
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
