{ lib, ... }:{
  flake.modules.homeManager.base = {pkgs, ...}:{
    programs.helix = {
      enable = true;
      settings = {
        editor = {
          line-number = "relative";
          auto-pairs = true;
          completion-trigger-len = 1;
          bufferline = "always";
          lsp = {
            enable = true;
          };
          auto-save = {
            focus-lost = true;
          };
          whitespace = {
            render = "all";
          };
          indent-guides = {
            render = true;
          };
          statusline = {
            left = [
              "spinner"
              "mode"
            ];
            center = [
              "read-only-indicator"
              "file-name"
              "file-modification-indicator"
            ];
            right = [
              "diagnostics"
              "selections"
              "register"
              "position"
              "file-encoding"
            ];
          };

          file-picker = {
            hidden = false;
          };

          gutters = [
            "line-numbers"
            "diagnostics"
            "diff"
          ];

          softwrap.enable = true;

          inline-diagnostics = {
            cursor-line = "hint";
            other-lines = "error";
          };
          smart-tab = {
            enable = true;
          };
        };
      };
    };

    systemd.user.settings.Manager.DefaultEnvironment = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
  };
}
