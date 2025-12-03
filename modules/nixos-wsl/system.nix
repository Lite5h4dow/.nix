{ inputs, config, ... }:
{
  imports = [ inputs.nixos-wsl.nixosModules.default ];
  flake.modules.nixos.wsl = {
    # wsl = {
    #   enable = true;

    #   # useWindowsDriver = true;

    #   # interop = {
    #   #   includePath = true;
    #   #   register = false;
    #   # };

    #   wslConf = {
    #     user.default = config.flake.meta.user.name;
    #   };
    # };
  };
}
