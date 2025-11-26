{ ... }:
{
  flake.modules.homeManager.base.programs.yazi = {
    enable = true;
    # plugins = {pkgs}:{
    #   inherit (pkgs.yaziPlugins)
    #     git
    #     ouch
    #     sudo
    #     rsync
    #     chmod
    #     starship
    #     wl-clipboard
    #     yatline-catppuccin
    #     ;
    # };
  };
}
