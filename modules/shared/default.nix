{config, ...}:
let
  inherit (config.flake.modules) home;
in
{
  flake.modules.home.shared = {
    imports = with home;[
      user
      #################
      atuin
      bat
      eza
      fish
      git
      helix
      home-manager
      k9s
      # rclone
      ssh
      starship
      yazi
      zoxide
    ];

  };
}
