{ config, ... }:
{
  flake.meta.user = {
    name = "lotus";
  };

  flake.modules.nixos.base = {
    users.users.${config.flake.meta.user.name} = {
      isNormalUser = true;
      extraGroups = ["wheel" "dialout"];
    };
  };
}
