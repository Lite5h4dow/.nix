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
      type = "github";
      owner = "nix-community";
      repo = "nixos-vscode-server";
    };

    hyprland = {
      type = "github";
      owner = "hyprwm";
      repo = "hyprland";
      ref = "v0.52.2";
    };

    hyprland-plugins = {
      type = "github";
      owner = "hyprwm";
      repo = "hyprland-plugins";
      ref = "v0.52.0";
      inputs.hyprland.follows = "hyprland";
    };

    hyprtasking = {
      type = "github";
      owner = "raybbian";
      repo = "hyprtasking";
      inputs.hyprland.follows = "hyprland";
    };

    # hyprspace = {
    #   type = "github";
    #   owner = "KZDKM";
    #   repo = "Hyprspace";
    #   inputs.hyprland.follows = "hyprland";
    # };

    split-monitor-workspaces = {
      type = "github";
      owner = "Duckonaut";
      repo = "split-monitor-workspaces";
      ref = "a01946c0a81f94463232df7fd5c9b7d2581f89e1";
      inputs.hyprland.follows = "hyprland";
    };

    hyprgrass = {
      type = "github";
      owner = "horriblename";
      repo = "hyprgrass";
      inputs.hyprland.follows = "hyprland";
    };

    hypr-dynamic-cursors = {
      type = "github";
      owner = "VirtCode";
      repo = "hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };

    iio-hyprland = {
      type = "github";
      owner = "JeanSchoeller";
      repo = "iio-hyprland";
    };

    zen-browser = {
      type = "github";
      owner = "youwen5";
      repo = "zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      type = "github";
      owner = "kaylorben";
      repo = "nixcord";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    curd = {
      type = "github";
      owner = "Wraient";
      repo = "curd";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      type = "github";
      owner = "fufexan";
      repo = "nix-gaming";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ (inputs.import-tree ./modules) ];
      _module.args.rootPath = ./.;
    };
}
