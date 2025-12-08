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
        desktop
        base
        boot
        ui
        audio
        input
        gaming
        vr
        extras
        cad
        dev
        dev-extras
        gamesdev
        networking
        wireless
        bluetooth
        graphics
        virtualisation
        cpu-amd
        gpu-nvidia
        {
          networking.hostName = "odin";
          system.stateVersion = "25.11";
          home-manager.users.${config.flake.meta.user.name} = {
            wayland.windowManager.hyprland.settings = {
              monitor = [
                "DP-1, 3440x1440@144, 0x0, 1"
                "DP-2, 1920x1080@74.97, 3440x0, 1, transform, 3"
              ];
            };
          };
        }
      ];
  };
}
