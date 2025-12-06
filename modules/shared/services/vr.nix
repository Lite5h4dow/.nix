{ ... }:
{
  flake.modules.nixos.vr = { config, pkgs, ... }:{
    services.wivrn = {
      enable = true;
      package = pkgs.wivrn.override {
        cudaSupport = config.flake.meta.cudaAvailable;
      };
      defaultRuntime = true;
      highPriority = true;
      openFirewall = true;
      steam.importOXRRuntimes = true;
    };
  };
}
