{
  flake.modules.homeManager.base.programs.atuin = {
    enable = true;

    settings = {
      auto_sync = true;
      sync_address = "https://atuin.litelot.us";
      sync_frequency = "5m";
      search_mode = "fuzzy";
    };
  };
}
