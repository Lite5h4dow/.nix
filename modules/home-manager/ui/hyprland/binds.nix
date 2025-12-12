{ ... }:
{
  flake.modules = {
    homeManager.ui = {
      wayland.windowManager.hyprland.settings =
        let
          mod = "SUPER";
          shift = "SHIFT";
          ctrl = "CONTROL";
          secondary = ctrl;
        in
        {
          bind = [
            # core
            # "${mod}, Return, exec, ghostty --gtk-single-instance=true"
            "${mod}, q, killactive"

            # menus
            # "${mod}${shift}, semicolon, exec, rofimoji"
            # ", XF86PowerOff, exec, rofi -show p -modi p:'rofi-power-menu'"
            # "${mod}${secondary}, b, exec, rofi-bluetooth"
            # "${mod}${secondary}, Space, exec, ~/.config/ags/shared/scripts/sidebar.sh toggle-applauncher"

            #window switcher
            # "${mod}, tab, exec, hyprshell gui --mod-key super --key tab --close mod-key-release --reverse-key=mod=shift && hyprswitch dispatch"
            # "${mod}${shift}, tab, exec, hyprshell gui --mod-key super --key tab --close mod-key-release --reverse-key=mod=shift && hyprswitch dispatch -r"

            # utils
            "${mod} ${shift}, p, pin"
            "${mod}, f, togglefloating"
            "${mod}, p, pseudo"
            "${mod}, s, togglesplit"
            "${mod}, t, togglegroup"

            # hyprshot
            # "${mod} ${shift}, s, exec, hyprshot -m region"
            # "${mod} , Print, exec, hyprshot -m output"

            # audio
            ", XF86AudioPrev, exec, playerctl previous"
            ", XF86AudioNext, exec, playerctl next"
            # The stop function is pretty much useless, use it to restart the playing media instead
            ", XF86AudioStop, exec, playerctl position 0"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

            # special workspaces
            # "${mod}${shift}, Return, togglespecialworkspace, terminal_zen"
            # "${mod}, e, togglespecialworkspace, file_manager_tui"
            # "${mod}${shift}, e, togglespecialworkspace, file_manager_gui"
            # "${mod}, r, togglespecialworkspace, remote_desktop_gui"
            # "${mod}${secondary}, r, togglespecialworkspace, remote_desktop_glacier"

            # move focus
            "${mod}, h, movefocus, l"
            "${mod}, j, movefocus, d"
            "${mod}, k, movefocus, u"
            "${mod}, l, movefocus, r"

            # move window
            "${mod}${shift}, h, movewindow, l"
            "${mod}${shift}, j, movewindow, d"
            "${mod}${shift}, k, movewindow, u"
            "${mod}${shift}, l, movewindow, r"

            # select workspace
            "${mod}, 1, split-workspace, 1"
            "${mod}, 2, split-workspace, 2"
            "${mod}, 3, split-workspace, 3"
            "${mod}, 4, split-workspace, 4"
            "${mod}, 5, split-workspace, 5"
            "${mod}, 6, split-workspace, 6"
            "${mod}, 7, split-workspace, 7"
            "${mod}, 8, split-workspace, 8"
            "${mod}, 9, split-workspace, 9"
            "${mod}, 0, split-workspace, 10"

            # move window to workspace
            # dont follow
            "${mod}${shift}${secondary}, 1, split-movetoworkspacesilent, 1"
            "${mod}${shift}${secondary}, 2, split-movetoworkspacesilent, 2"
            "${mod}${shift}${secondary}, 3, split-movetoworkspacesilent, 3"
            "${mod}${shift}${secondary}, 4, split-movetoworkspacesilent, 4"
            "${mod}${shift}${secondary}, 5, split-movetoworkspacesilent, 5"
            "${mod}${shift}${secondary}, 6, split-movetoworkspacesilent, 6"
            "${mod}${shift}${secondary}, 7, split-movetoworkspacesilent, 7"
            "${mod}${shift}${secondary}, 8, split-movetoworkspacesilent, 8"
            "${mod}${shift}${secondary}, 9, split-movetoworkspacesilent, 9"
            "${mod}${shift}${secondary}, 0, split-movetoworkspacesilent, 10"
            # follow
            "${mod}${shift}, 1, split-movetoworkspace, 1"
            "${mod}${shift}, 2, split-movetoworkspace, 2"
            "${mod}${shift}, 3, split-movetoworkspace, 3"
            "${mod}${shift}, 4, split-movetoworkspace, 4"
            "${mod}${shift}, 5, split-movetoworkspace, 5"
            "${mod}${shift}, 6, split-movetoworkspace, 6"
            "${mod}${shift}, 7, split-movetoworkspace, 7"
            "${mod}${shift}, 8, split-movetoworkspace, 8"
            "${mod}${shift}, 9, split-movetoworkspace, 9"
            "${mod}${shift}, 0, split-movetoworkspace, 10"
          ];

          binde = [
            "${mod}${ctrl}, h, resizeactive, -50 0"
            "${mod}${ctrl}, j, resizeactive, 0 50"
            "${mod}${ctrl}, k, resizeactive, 0 -50"
            "${mod}${ctrl}, l, resizeactive, 50 0"

            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

            ", XF86MonBrightnessUp, exec, brightnessctl set 2%+"
            ", XF86MonBrightnessDown, exec, brightnessctl set 2%- -n"
          ];

          bindm = [
            "${mod}, mouse:272, movewindow"
            "${mod}, mouse:273, resizewindow"
          ];

          # bindr = [
          #   "${mod}, ${mod}_L, exec, pkill rofi || ${rofi} -show drun -show-icons"
          # ];

          gesture = [
            "3, horizontal, workspace"
            "3, pinchin, fullscreen"
            "3, pinchout, float"
          ];
        };
    };
  };
}
