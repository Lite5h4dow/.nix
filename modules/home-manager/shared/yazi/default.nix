{ ... }:
{
  flake.modules.homeManager.base = { pkgs, ... }:
  {
      programs.yazi = {
        enable = true;
        enableFishIntegration = true;
        plugins = {
          inherit (pkgs.yaziPlugins)
            git
            ouch
            sudo
            rsync
            chmod
            starship
            wl-clipboard
            yatline-catppuccin
            ;
        };
      };
    };
}
