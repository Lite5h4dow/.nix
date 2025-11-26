{ inputs, config, ... }:
{
  flake.modules.home.stylix = {
    home-manager.config.stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";
    };
  };

  flake.modules.nixOnDroid.stylix =
    let
      inherit (config.flake.modules) home;
    in
    {
      imports = [
        inputs.stylix.nixOnDroidModules.stylix
        home.stylix
      ];
    };

}
