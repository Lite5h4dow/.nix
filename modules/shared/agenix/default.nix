{ inputs, ...}:
{
  flake.modules = {
    nixos.base = {pkgs, ...}:{
      imports = [inputs.agenix.nixosModules.default];
      environment.systemPackages = [
        inputs.agenix.${pkgs.system}.default
      ];
    };
  };
}
