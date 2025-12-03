{...}:
{
  flake.modules.nixos.wsl = {
    programs = {
      command-not-found.enable = false;
    };
  };
}
