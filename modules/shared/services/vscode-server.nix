{inputs, ...}:
let
  module' = {pkgs, ...}:
  {
    imports = [
      inputs.vscode-server.nixosModules.default
    ];
    services.vscode-server = {
      enable = true;
      enableFHS = true;
    };
  };
in
{

  flake.modules = {
    nixos.wsl = module';
    # nixOnDroid.default = module';
  };
}
