{ ... }:
{
  flake.modules.nixos={
    base = { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ toybox ];
    };

    extras = {pkgs, ...}:
    {
      environment.systemPackages = with pkgs; [ deskflow ];
    };
  };

}
