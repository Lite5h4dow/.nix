{
  flake.modules.nixos.mullvad-ui = { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      mullvad-vpn
    ];
  };
}
