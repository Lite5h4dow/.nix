{ ... }:
{
  flake.modules.homeManager.base.programs.yazi = {pkgs}:{
    enable = true;
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
}
