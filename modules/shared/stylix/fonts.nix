{
  flake.modules.home.stylix =
    { pkgs, ... }:
    let
      defaultFont = pkgs.nerd-fonts.fira-code;
      emojiFont = pkgs.noto-fonts-emoji;
    in
    {
      home-manager.config.stylix.fonts =
        {
          sansSerif = {
            package = defaultFont;
            name = "FiraCode Nerd Font Mono";
          };

          serif = {
            package = defaultFont;
            name = "FiraCode Nerd Font Mono";
          };

          emoji = {
            package = emojiFont;
            name = "Noto Color Emoji";
          };

          monospace = {
            package = defaultFont;
            name = "FiraCode Nerd Font Mono";
          };
        };
    };
}
