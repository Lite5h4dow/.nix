{ config, lib, ... }:
{
  flake.modules.meta.user = {
    name = lib.mkDefault "lotus";
  };
}
