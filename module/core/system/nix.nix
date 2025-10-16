{...}:{
  config = {
    nix= {
      package = packages.lix;

      settings = {
        accept-flake-config = true;

        warn-dirty = true;
        trusted-users = ["root" "@wheel"];

        auto-optimise-store = true;
        builders-use-substitutes = true;

        experimental-features = ["nix-command" "flakes"];
        log-lines = 30;
        http-connections = 50;

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

      registry = {
        nixpkgs.flake = nixpkgs;
        n.flake = nixpkgs;
        default.flake = nixpkgs;
      };

      channel.enable = false;

      nixPath = [
        "nixpkgs=${nixpkgsPath}"
        "n=${nixpkgsPath}"
        "default=${nixpkgsPath}"
      ];
    };
  };
}
