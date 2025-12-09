{ inputs, config, ... }:
{
  flake.modules.nixos.wsl = {
    imports = [ inputs.nixos-wsl.nixosModules.default ];
    wsl = {
      enable = true;

      useWindowsDriver = true;

      interop = {
        includePath = true;
        register = false;
      };

      wslConf = {
        network = {
          hostname = "flake-wsl";
          generateHosts = false;
        };
      };

      defaultUser = config.flake.meta.user.name;
    };
  };
}
