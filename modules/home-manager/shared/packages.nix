{ ... }:
{
  flake.modules.homeManager = {
    dev = { pkgs, ... }:
    {
      programs = {
        go.enable = true;
        gcc.enable = true;
      };
      home.packages = with pkgs; [
        pulumi-bin
      ];
    };
  };
}
