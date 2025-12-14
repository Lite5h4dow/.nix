{ ... }:
{
  flake.modules.homeManager.base = { pkgs, ... }:
  {
    programs.yt-dlp = {
      enable = true;
      config = {
        cookies-from-browser = "firefox:~/.zen";
      };
    };
  };
}
