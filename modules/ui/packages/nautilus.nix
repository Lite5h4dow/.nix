{
  flake.modules.nixos.ui = {pkgs, ...}:
  {
    services.gvfs.enable = true;
    environment.systemPackages = with pkgs;[
      nautilus
    ];
  };
}
