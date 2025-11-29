{ inputs, config, ... }:
{
  imports = [ inputs.nixos-wsl.nixosModules.default ];
  flake.modulesnixos.wsl = {
    wsl = {
      enable = true;

      useWindowsDriver = true;

      interop = {
        includePath = true;
        register = false;
      };

      wslConf = {
        user.default = config.flake.meta.user.name;
      };
    };
  };
}
