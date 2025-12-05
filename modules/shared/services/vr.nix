{ ... }:
{
  flake.modules.nixos.vr = {
    services.wivrn = {
      enable = true;
      highPriority = true;
      openFirewall = true;
      steam.importOXRRuntimes = true;
    };
  };
}
