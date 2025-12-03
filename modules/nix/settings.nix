{lib, config, ...}:
{
  options.nix.settings = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.anything;
  };
  config = {
    nix.settings = {
      keep-outputs = true;
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
        "recursive-nix"
      ];
      extra-system-features = [ "recursive-nix" ];
      accept-flake-config = true;
      trusted-users = ["root" "@wheel"];

      substituters=[
        "https://cache.nixos.org/"
      ];
      extra-substituters = [
        "https://hyprland.cachix.org"
      ];
      extra-trusted-substituters=[
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };

    flake.modules = {
      nixos.base.nix = {
        inherit (config.nix) settings;
      };
      homeManager.base.nix = {
        inherit (config.nix) settings;
      };
      nixOnDroid.base.nix.extraOptions =  lib.concatLines (lib.mapAttrsToList (name: value: "${name} = ${toString value}") config.nix.settings);
    };
  };
}
