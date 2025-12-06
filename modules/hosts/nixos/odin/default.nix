{ inputs, config, ... }:
{
  flake.nixosConfigurations."odin" = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      config = {
        allowUnfree = true;
      };
      system = "x86_64-linux";
      stdenv.hostPlatform.system = "x86_64-linux";
    };
    modules =
      with config.flake.modules.nixos;
      [
        base
        boot
        ui
        audio
        input
        gaming
        vr
        dev
        wireless
        bluetooth
        graphics
        virtualisation
        cpu-intel
        gpu-intel
        gpu-nvidia
        {
          networking.hostName = "odin";
          system.stateVersion = "25.11";
        }
      ];
  };
}
