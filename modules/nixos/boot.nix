{
  flake.modules.nixos.boot = {
    boot = {
      loader.limine = {
        enable = true;
      };
    };
  };
}
