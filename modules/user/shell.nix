{config, lib, ...}:
{
  flake.modules = {
    nixos.base = nixosArgs@{pkgs,...}:{
      programs.fish.enable = true;
      users.defaultUserShell = pkgs.fish;
      users.users.${config.flake.meta.user.name}.shell =
        nixosArgs.config.home-manager.users.${config.flake.meta.user.name}.programs.fish.package;
    };
    nixOnDroid.base = {pkgs, ...}:
    {
      user.shell = lib.getExe pkgs.fish;
    };
  };
}
