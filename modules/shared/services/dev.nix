{
  flake.modules.nixos = {
    dev = {
      services.openbao.enable = true;
    };
  };
}
