{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "GBM_BACKEND,nvidia-drm"
      ];

      monitor = [
        "eDP-1, 2560x1600@60,  440x1440, 1, bitdepth, 10"
        "DP-1,  3440x1440@144, 0x0,      1, bitdepth, 10"
        ",preferred,auto,1"
      ];

      workspace = [
        "1, monitor:DP-1, default:true"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:eDP-1, default:true"
        "6, monitor:eDP-1"
        "7, monitor:eDP-1"
        "8, monitor:eDP-1"
      ];

      general = {
        border_size = 2;
        gaps_in = 6;
        gaps_out = 12;
        layout = "scrolling";
        resize_on_border = true;
      };

      scrolling = {
          fullscreen_on_one_column = false;
      };

      decoration = {
        rounding = 8;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
      };

      animations = {
        enabled = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      "$mod" = "SUPER";

      bind = [
        "$mod, Q, killactive,"
        "$mod, M, togglefloating,"
        "$mod ALT SHIFT, I, exit,"

        "$mod, H, layoutmsg, focus l"
        "$mod, L, layoutmsg, focus r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        "$mod SHIFT, H, layoutmsg, swapcol l"
        "$mod SHIFT, L, layoutmsg, swapcol r"
        "$mod SHIFT, K, swapwindow, u"
        "$mod SHIFT, J, swapwindow, d"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"

        "$mod, T, exec, kitty"
        "$mod, E, exec, kitty --title 'yazi' yazi"
        "$mod, N, exec, kitty --title 'neovim' nvim"

        "$mod, R, exec, dms ipc spotlight toggle"
        "$mod, TAB, exec, dms ipc processlist toggle"

        "$mod, B, exec, firefox"
        "$mod, O, exec, obsidian"
        "$mod, D, exec, vesktop"
        "$mod, G, exec, gimp"

        "$mod, S, exec, spotify"
        "$mod, P, exec, playerctl play-pause"

        "$mod, Print, exec, grim -g \"$(slurp)\" - | wl-copy"

        # Power menu
        "$mod ALT SHIFT, I, exec, exit"
        "$mod ALT SHIFT, L, exec, swaylock -f"
        "$mod ALT SHIFT, S, exec, systemctl suspend"
        "$mod ALT SHIFT, U, exec, systemctl poweroff"
        "$mod ALT SHIFT, R, exec, systemctl reboot"

        "$mod, left, layoutmsg, move -col"
        "$mod, right, layoutmsg, move +col"

        "$mod, equal, layoutmsg, colresize +conf"
        "$mod, minus, layoutmsg, colresize -conf"
        "$mod, 0, layoutmsg, colresize 0.5"

        "$mod, C, exec, hyprpicker -a"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioPlay, exec, playerctl play-pause"
      ];

      binde = [
        "$mod ALT, H, resizeactive, -50 0"
        "$mod ALT, J, resizeactive, 0 50"
        "$mod ALT, K, resizeactive, 0 -50"
        "$mod ALT, L, resizeactive, 50 0"
      ];

      bindel = [
        ", XF86MonBrightnessUp, exec, dms ipc call brightness increment 10 \"\""
        ", XF86MonBrightnessDown, exec, dms ipc call brightness decrement 10 \"\""
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };

    extraConfig = ''
      layerrule = no_anim on, match:namespace ^(quickshell)$
      layerrule = no_anim on, match:namespace ^dms:.*

      windowrule = float on, match:title ^(Control Center)$
      windowrule = float on, match:title ^(Calendar)$
      windowrule = float on, match:title ^(WiFi Password)$
      windowrule = pin on, match:title ^(Control Center)$
      windowrule = pin on, match:title ^(Calendar)$
      windowrule = pin on, match:title ^(WiFi Password)$
      windowrule = border_size 0, match:title ^(Control Center)$
      windowrule = border_size 0, match:title ^(Calendar)$
      windowrule = border_size 0, match:title ^(WiFi Password)$
      windowrule = no_anim on, match:title ^(Control Center)$
      windowrule = no_anim on, match:title ^(Calendar)$
      windowrule = no_anim on, match:title ^(WiFi Password)$
      windowrule = move (monitor_w-340-20) 40, match:title ^(Control Center)$
      windowrule = move ((monitor_w-300)/2) 40, match:title ^(Calendar)$
      windowrule = move ((monitor_w-300)/2) 100, match:title ^(WiFi Password)$

      source = ./dms/colors.conf
      source = ./dms/outputs.conf
      source = ./dms/layout.conf
      source = ./dms/cursor.conf
      source = ./dms/binds.conf
      source = ~/.config/hypr/matugen-colors.conf
    '';
  };
}
