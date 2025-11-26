{
  flake.modules.homeManager.base.programs.k9s = {
    enable = true;
    settings = {
      k9s = {
        liveViewAutoRefresh = true;
        refreshRate = 1;
        reactive = true;
        ui = {
          noIcons = false;
          logoless = true;
        };
        logger = {
          textWrap = true;
        };
      };
    };
  };
}
