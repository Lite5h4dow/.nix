{
  description = "Description for the project";

  nixConfig = {
    warn-dirty = false;
    abort-on-warn = false;
    extra-experimental-features = [ "pipe-operators" ];
    experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
      "recursive-nix"
    ];
    # allow-import-from-derivation = false;
  };

  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/release-25.11";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    import-tree = {
      url = "github:vic/import-tree";
    };

    tinted-schemes = {
      flake = false;
      url = "github:tinted-theming/schemes";
    };

    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      ref = "v0.52.2-b";
      submodules = true;
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      # Hyprspace uses latest Hyprland. We declare this to keep them in sync.
      inputs.hyprland.follows = "hyprland";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    curd = {
      url = "github:Wraient/curd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ (inputs.import-tree ./modules) ];
      _module.args.rootPath = ./.;
    };
}
