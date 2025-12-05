{ inputs, config, ... }:
{
  flake.nixosConfigurations."laptop" = inputs.nixpkgs.lib.nixosSystem {
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
        laptop
        ui
        audio
        input
        gaming
        vr
        dev
        wireless
        bluetooth
        graphics
        cpu-intel
        gpu-intel
        gpu-nvidia
        {
          networking.hostName = "glacier-blade";
          system.stateVersion = "25.11";
        }
      ];
  };
}
