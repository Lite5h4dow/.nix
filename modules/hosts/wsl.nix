{ inputs, config, ... }:
{
  flake.nixosConfigurations = {
    "wsl" = inputs.nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
      };
      modules = [
        config.flake.modules.nixos.base
        config.flake.modules.nixos.wsl
        {system.stateVersion = "25.11";}
      ];
    };
  };
}

