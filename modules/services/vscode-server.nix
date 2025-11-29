{inputs, ...}:
let
  module' = {pkgs, ...}:
  {
    services.vscode-server = {
      enable = true;
      enableFHS = true;
      enableRuntimeDependencies = with pkgs; [
        curl
        icu
        wget
      ];
    };
  };
in
{
  imports = [
    inputs.vscode-server.nixosModules.default
  ];

  flake.modules = {
    nixos.wsl = module';
    nixOnDroid.default = module';
  };
}
