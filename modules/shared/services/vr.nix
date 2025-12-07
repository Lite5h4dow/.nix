{ ... }:
{
  flake.modules.nixos.vr = {
    services.wivrn = {
      enable = true;
      autoStart = true;
      highPriority = true;
      openFirewall = true;
      steam.importOXRRuntimes = true;
    };
  };
}
