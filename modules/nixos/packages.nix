{ ... }:
{
  flake.modules.nixos={
    base = { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [ toybox ];
    };

    extra = {pkgs, ...}:
    {
      environment.systemPackages = with pkgs; [ deskflow ];
    };
  };

}
