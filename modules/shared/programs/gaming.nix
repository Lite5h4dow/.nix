{ ... }:
{
  flake.modules.nixos.gaming = { ... }:{
    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
        protontricks.enable = true;
      };
    };
    networking.extraHosts = "0.0.0.0 modules-cdn.eac-prod.on.epicgames.com";
    nix.settings = {
      extra-substituters = ["https://nix-gaming.cachix.org"];
      extra-trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
    };
  };
}
