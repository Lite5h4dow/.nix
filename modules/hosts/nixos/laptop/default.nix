{ inputs, config, ... }:
{
  flake.nixosConfigurations."laptop" = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      stdenv.hostPlatform.system = "x86_64-linux";
    };
    modules =
      with config.flake.modules.nixos;
      [
        base
        boot
        laptop
        ui
        audio
        wireless
        bluetooth
        cpu-intel
        gpu-intel
        gpu-nvidia
        { system.stateVersion = "25.11"; }
      ];
  };
}
