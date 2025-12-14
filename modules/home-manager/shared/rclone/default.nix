{ config, ... }:
{
  flake.modules.homeManager.base.programs.rclone = {
    enable = true;
    remotes = {
      "filestore" = {
        config = {
          type = "webdav";
          vendor = "owncloud";
          url = "https://fs.litelot.us";
          user = "litelotus";
        };
        mounts = {
          "/" = {
            enable = true;
            mountPoint = "/home/${config.flake.meta.user.name}/filestore";
            options = {
              dir-cache-time = "30s";
              poll-interval = "5s";
              vfs-cache-mode = "writes";
              allow-other = true;
            };
          };
        };
      };
    };
  };
}
