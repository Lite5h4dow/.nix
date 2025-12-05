{ ... }:
{
  flake.modules.nixos.vr = {
    services.wivrn = {
      enable = true;
      defaultRuntime = true;
      highPriority = true;
      openFirewall = true;
      steam.importOXRRuntimes = true;
    };
  };
}
