{ inputs, config, ... }:
{
  flake.nixosConfigurations = {
    "nixos-wsl" = inputs.nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        cudaSupport = true;
        stdenv.hostPlatform.system = "x86_64-linux";
      };
      modules = [
        config.flake.modules.nixos.base
        config.flake.modules.nixos.wsl
        config.flake.modules.nixos.dev-extras
        {
          system.stateVersion = "25.11";
          networkin.hostName = "nixos-wsl";
        }
      ];
    };
  };
}

