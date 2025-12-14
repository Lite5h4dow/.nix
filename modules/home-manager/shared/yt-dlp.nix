{ ... }:
{
  flake.modules.homeManager.base = { pkgs, ... }:
  {
    programs.yt-dlp = {
      enable = true;
      settings = {
        cookies-from-browser = "firefox:~/.zen";
      };
    };
  };
}
