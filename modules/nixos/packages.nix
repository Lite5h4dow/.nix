{ ... }:
{
  flake.modules.nixos={
    base = { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ toybox ];
    };

    extras = {pkgs, ...}:
    {
      environment.systemPackages = with pkgs; [
        lan-mouse
        teams-for-linux
      ];
    };
  };

}
