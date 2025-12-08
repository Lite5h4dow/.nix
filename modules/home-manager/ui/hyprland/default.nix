{ inputs, ... }:
{
  flake.modules = {
    homeManager.ui = { pkgs, ... }:
    let
      inherit (inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}) hyprland;
    in
    {
      wayland.windowManager.hyprland = {
        enable=true;
        package=hyprland;
        settings = {
          monitor = [", preferred, auto, 1"];
          env = [
            "XDG_SESSION_DESKTOP, Hyprland"
            "GDK_BACKEND, wayland"
            "SDL_VIDEODRIVER, wayland"
            "LIBVA_DRIVER_NAME, nvidia"
            "__GLX_VENDOR_LIBRARY_NAME, nvidia"
            "QT_QPA_PLATFORM, wayland;xcb"
          ];

          ecosystem = {
            no_update_news = true;
            no_donation_nag = true;
          };

          input = {
            kb_layout = "us";
            follow_mouse = "1";

            accel_profile = "flat";
            scroll_method = "on_button_down";

            touchpad = {
              natural_scroll = true;
              # tap_to_click = true;
              # clickfinger_behaviour = true;
            };
          };
          general = {
            gaps_in = 5;
            gaps_out = 5;
          };

          decoration = {
            rounding = 10;
            blur = {
              enabled = true;
              size = 8;
              passes = 1;
            };
          };

          group.groupbar = {
            gradients = true;
            gradient_rounding = 5;
            height = 20;
            gradient_round_only_edges = false;
            indicator_height = 0;
            font_size = 12;
            gaps_in = 5;
            gaps_out = 5;
          };

          dwindle = {
            pseudotile = "yes";
            preserve_split = "yes";
          };

          xwayland = {
            force_zero_scaling = true;
          };

          animations = {
            enabled = true;
          };

          misc = {
            middle_click_paste = false;
            focus_on_activate = true;

            animate_manual_resizes = true;
            animate_mouse_windowdragging = true;

            disable_hyprland_logo = true;
          };

          windowrulev2 = [
            "float, pin, initialTitle:(Picture-in-Picture)"
          ];

          binds = {
            allow_workspace_cycles = true;
          };
        };
      };
    };
  };
}
