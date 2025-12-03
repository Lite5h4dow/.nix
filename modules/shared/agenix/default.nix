{ inputs, ...}:
{
  flake.modules = {
    nixos.base = {system, ...}:{
      imports = [inputs.agenix.nixosModules.default];
      environment.systemPackages = [
        inputs.agenix.${system}.default
      ];
    };
  };
}
