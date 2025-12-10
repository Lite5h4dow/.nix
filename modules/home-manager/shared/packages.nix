{ ... }:
{
  flake.modules.homeManager = {
    dev = { pkgs, ... }:
    {
      programs.go.enable = true;
      home.packages = with pkgs; [
        pulumi-bin
      ];
    };
  };
}
