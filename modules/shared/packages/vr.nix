{ ... }:
{
  flake.modules.nixos.vr = { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      wlx-overlay-s
    ];
  };
}
