{ host, pkgs, ... }: 
{
  imports = [
    ../../features/pipewire
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
        user = "${host.user}";
      };

      initial_session = {
        command = "Hyprland";
        user = "${host.user}";
      };
    };
  };

  services.upower = {
    enable = true;
  };

  services.logind = {
    extraConfig = ''
      HandlePowerKey=suspend
    '';
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  home-manager.users."${host.user}" = {
    imports = [
      ../../../home-manager/desktop-environment/hypridle
      ../../../home-manager/desktop-environment/hyprlock
      ../../../home-manager/desktop-environment/hyprpaper
      ../../../home-manager/desktop-environment/HyprPanel
      ../../../home-manager/desktop-environment/hyprshell
      ../../../home-manager/desktop-environment/rofi
      ../../../home-manager/programs/kitty
    ];

    home.packages = with pkgs; [
      jq
    ];

    home.file.".local/bin/hyprfocus" = {
      executable = true;
      source = ./hyprfocus.sh;
    };

    services.hyprpolkitagent = {
      enable = true;
    };

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        debug = {
          disable_logs = false;
        };

        "$terminal" = "kitty";
        "$mainMod" = "SUPER";

        exec-once = [
          "hyprlock"
          "hyprpanel"
          "hyprshell run -vv"
        ];

        general =  {
          gaps_out = 5;
        };

        decoration = {
          rounding = 10;
          inactive_opacity = 0.9;
        };

        input = {
          kb_layout = "at,de";
          kb_options = "grp:alt_space_toggle";
          natural_scroll = true;

          touchpad = {
            natural_scroll = true;
          };
        };

        monitor = [
          "eDP-1, 2256x1504@60, 0x0, 1"
 #         "DP-1, 2560x1440@165, 0x0, 1"
 #        "DP-2, 2560x1440@165, 2560x0, 1"
 #         "WAYLAND-1, disabled"
        ];

        bind = [
          # General
          "$mainMod, T, exec, $terminal"
          "$mainMod, Q, exit"
          "$mainMod, F, togglefloating"
          "$mainMod, page_up, fullscreen"
          "$mainMod, B, exec, firefox"
          "$mainMod, L, exec, hyprlock"
          "$mainMod, Space, exec, rofi -show combi -combi-modes window,drun"
          "ALT, F4, killactive"

          # Focus
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          # Workspace switch with: mainMod + [ 0-9 ]
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          # Move window to workspace with: mainMod Shift + [ 0-9 ]
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"

          "$mainMod SHIFT, up, movetoworkspace, -1"
          "$mainMod SHIFT, down, movetoworkspace, +1"
        ];

        # +locked
        bindl = [
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioNext, exec, playerctl position 5+"
          ", XF86AudioPrev, exec, playerctl position 5-"

          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

          ", switch:Lid Switch, exec, pidof hyprlock || hyprlock"
        ];

        # +locked +repeat
        bindle = [
          ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86MonBrightnessDown, exec, brightnessctl -s set 5%-"
          ", XF86MonBrightnessUp, exec, brightnessctl -s set +5%"
        ];

        # +locked +long-press
        bindlo = [
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
        ];
      };
    };
  };
}
