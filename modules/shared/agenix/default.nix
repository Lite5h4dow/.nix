{ inputs, ...}:
{
  flake.modules = {
    nixos.base = {pkgs, ...}:{
      imports = [inputs.agenix.nixosModules.default];
      environment.systemPackages = [
        inputs.agenix.packages.${pkgs.system}.default
      ];
    };
  };
}
