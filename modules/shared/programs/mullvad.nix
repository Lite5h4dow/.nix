{ ... }:
{
  flake.modules.nixos.mullvad ={ pkgs, ... }:
  {
    services.mullvad-vpn.enable = true;
    environment.systemPackages = with pkgs; [
      mullvad
      mullvad-closest
    ];
  };
}
