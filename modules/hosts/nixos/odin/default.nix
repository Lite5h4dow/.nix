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
    modules = let
      username = config.flake.meta.user.name;
      freenect2' = config.flake.packages."x86_64-linux".freenect2;
      in
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
        mullvad
        mullvad-ui
        wireless
        bluetooth
        graphics
        virtualisation
        cpu-amd
        gpu-nvidia
        ({...}:{
          networking.hostName = "odin";
          system.stateVersion = "25.11";
          environment.systemPackages = [
            freenect2'
          ];
          services.udev.extraRules = ''
            # ATTR{product}=="Kinect2"
            SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02c4", MODE="0666"
            SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02d8", MODE="0666"
            SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02d9", MODE="0666"
          '';
          home-manager.users.${username} = {
            wayland.windowManager.hyprland.settings = {
              monitor = [
                "DP-1, 3440x1440@144, 0x0, 1"
                "DP-2, 1920x1080@74.97, 3440x0, 1, transform, 3"
              ];
            };
          };
        })
      ];
  };
}
