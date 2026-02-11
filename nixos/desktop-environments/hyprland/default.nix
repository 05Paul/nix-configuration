{ config, pkgs, lib, ... }: 
let
  inherit (config.customization) user;
  inherit (config.customization) desktop;
  inherit (config.customization) gamescope;
  inherit (config.lib.stylix) colors;
in
{
  imports = [
    ../../features/pipewire
  ];

  services.greetd = {
    enable = true;
    settings = {
      terminal = {
        vt = desktop.tty;
      };
      default_session = {
        command = "${pkgs.greetd}/bin/agreety --cmd Hyprland";
        user = "${user.name}";
      };

      initial_session = {
        command = "Hyprland";
        user = "${user.name}";
      };
    };
  };

  services.upower = {
    enable = true;
  };

  services.ddccontrol = {
    enable = true;
  };
  
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      ddcci-driver
    ];

    kernelModules = [
      "ddcci"
      "i2c-dev"
    ];

    kernelParams = [
      "ddcci.enable_backlight=1"
    ];
  };

  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

  environment.systemPackages = with pkgs; [
    ddcutil
    brightnessctl
  ];

  users = {
    groups = {
      plugdev = {};
    };
    users."${user.name}" = {
      extraGroups = [
        "i2c"
        "plugdev"
        "video"
      ];
    };
  };

  services.logind = {
    settings.Login = {
      HandlePowerKey= "suspend";
    };
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  security.polkit = {
    enable = true;
  };

  home-manager.users."${user.name}" = {
    imports = [
      ../../../home-manager/desktop-environment/cliphist
      ../../../home-manager/desktop-environment/hypridle
      ../../../home-manager/desktop-environment/hyprlock
      ../../../home-manager/desktop-environment/hyprmon
      ../../../home-manager/desktop-environment/hyprpaper
      ../../../home-manager/desktop-environment/HyprPanel
      ../../../home-manager/desktop-environment/hyprshell
      ../../../home-manager/desktop-environment/hyprshot
      ../../../home-manager/desktop-environment/rofi
      ../../../home-manager/desktop-environment/satty
      ../../../home-manager/desktop-environment/screenshot-scripts
      ../../../home-manager/desktop-environment/wvkbd
      ../../../home-manager/programs/antimicrox
      ../../../home-manager/programs/kitty
      ../../../home-manager/programs/resources
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

    xdg.portal = {
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        debug = {
          disable_logs = false;
        };

        "$terminal" = "alacritty";
        "$mainMod" = "SUPER";

        exec-once = [
          "hyprlock"
          "hyprpanel"
          "wl-paste --type text --watch cliphist store" # Stores only text data
          "wl-paste --type image --watch cliphist store" # Stores only image data
        ] ++ lib.optional config.programs.steam.gamescopeSession.enable "antimicrox --tray --profile ~/.config/antimicrox/default.gamecontroller.amgp";

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

          touchpad = {
            natural_scroll = true;
          };

          touchdevice = {
            output = "desc:Wacom Tech Wacom One 13T 5BQ01D1000268";

          };
        };

        monitor = [
          ", preferred, auto, 1, mirror, DP-1"
          "eDP-1, 2256x1504@60, 0x0, 1"
          "desc:LG Electronics LG ULTRAGEAR 306MAPN8HB88, 2560x1440@144, 2256x-1440, 1"
          "desc:LG Electronics LG ULTRAGEAR 306MAVD8HB87, 2560x1440@144, -304x-1440, 1"
          "desc:Wacom Tech Wacom One 13T 5BQ01D1000268, 1920x1080@60, 2256x0, 1"
          "desc:Sony SONY TV  *30 0x01010101, disabled"
#          "DP-1, 2560x1440@165, 0x0, 1"
#          "DP-2, 2560x1440@165, 2560x0, 1"
#          "WAYLAND-1, disabled"
        ];

        gesture = [
          "3, horizontal, workspace"
          "4, up, dispatcher, exec, toggle_osk"
        ];

        device = [
          {
            name = "wacom-one-pen-display-13.3\"-with-touch-pen";
            output = "desc:Wacom Tech Wacom One 13T 5BQ01D1000268";
          }
        ];

        windowrule = [
          "float, center, class:floating"
          "tile, class:com.github.xournalpp.xournalpp"
        ];

        group = {
          groupbar = {
            font_size = 18;
            height = 20;
            gradients = true;
            gradient_rounding = 6;
            indicator_height = 0;
            text_color = lib.mkForce "rgba(${colors.base01}ff)";
            text_color_inactive = lib.mkForce "rgba(${colors.base07}ff)";
            "col.active" = lib.mkForce "rgba(${colors.base07}ee)";
            "col.inactive" = lib.mkForce "rgba(${colors.base01}99)";
          };
        };

        bindd = [
          # General
          "$mainMod, B, Open Firefox, exec, firefox"
          "$mainMod, F, Toggle floating, togglefloating"
          "$mainMod, L, Lock screen, exec, hyprlock"
          "$mainMod, P, Open hyprmon, exec, pkill hyprmon || kitty --class floating hyprmon"
          "$mainMod, N, Open network-settings, exec, pkill nmtui || kitty --class floating nmtui"
          "$mainMod, Q, Log out, exit"
          "$mainMod, R, Reload Panel, exec, hyprpanel --quit; hyprpanel& systemctl --user restart hyprshell"
          "$mainMod, T, Terminal, exec, $terminal"
          "$mainMod, V, Clipboard, exec, clipboard"
          "$mainMod, page_up, Fullscreen, fullscreen"
          "$mainMod, Space, Launcher, exec, rofi -show combi -combi-modes window,drun"
          "ALT, F4, Quit, killactive"
          ", Print, Screenshot, exec, screenshot"

          # Focus
          "$mainMod, left, Move focus left, movefocus, l"
          "$mainMod, right, Move focus right, movefocus, r"
          "$mainMod, up, Move focus up, movefocus, u"
          "$mainMod, down, Move focus down, movefocus, d"

          # Workspace switch with: mainMod + [ 0-9 ]
          "$mainMod, s, Toggle special workspace, togglespecialworkspace"
          "$mainMod, 1, Switch to workspace 1, workspace, 1"
          "$mainMod, 2, Switch to workspace 2, workspace, 2"
          "$mainMod, 3, Switch to workspace 3, workspace, 3"
          "$mainMod, 4, Switch to workspace 4, workspace, 4"
          "$mainMod, 5, Switch to workspace 5, workspace, 5"
          "$mainMod, 6, Switch to workspace 6, workspace, 6"
          "$mainMod, 7, Switch to workspace 7, workspace, 7"
          "$mainMod, 8, Switch to workspace 8, workspace, 8"
          "$mainMod, 9, Switch to workspace 9, workspace, 9"
          "$mainMod, 0, Switch to workspace 10, workspace, 10"

          # Move window to workspace with: mainMod Shift + [ 0-9 ]
          "$mainMod SHIFT, S, Move to special workspace, movetoworkspace, special"
          "$mainMod SHIFT, 1, Move to workspace 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, Move to workspace 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, Move to workspace 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, Move to workspace 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, Move to workspace 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, Move to workspace 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, Move to workspace 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, Move to workspace 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, Move to workspace 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, Move to workspace 10, movetoworkspace, 10"

          "$mainMod SHIFT, right, Move to next workspace, movetoworkspace, +1"
          "$mainMod SHIFT, left, Move to previous workspace, movetoworkspace, -1"

          "$mainMod SHIFT, up, Move workspace to next monitor, movecurrentworkspacetomonitor, +1"
          "$mainMod SHIFT, down, Move workspace to previous monitor, movecurrentworkspacetomonitor, -1"

          # groups
          "$mainMod, G, Toggle group, togglegroup"
          "$mainMod SHIFT, G, Move window out of group, moveoutofgroup"
          "$mainMod, TAB, Cycle to next window in group, changegroupactive, f"
          "$mainMod SHIFT, TAB, Cycle to previous window in group, changegroupactive, b"
          "$mainMod SHIFT CTRL, left, Move into group left, moveintogroup, l"
          "$mainMod SHIFT CTRL, right, Move into group right, moveintogroup, r"
          "$mainMod SHIFT CTRL, up, Move into group up, moveintogroup, u"
          "$mainMod SHIFT CTRL, down, Move into group down, moveintogroup, d"
        ];

        # +locked
        binddl = [
          ", XF86AudioPlay, Play/Pause, exec, playerctl play-pause"

          ", XF86AudioNext, Forward 5 seconds, exec, playerctl position 5+"
          ", XF86AudioPrev, Rewind 5 seconds, exec, playerctl position 5-"

          ", XF86AudioMute, Mute audio, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

          ", switch:on:Lid Switch, Set brightness to 0%, exec, brightnessctl set 0%"
          ", switch:off:Lid Switch, Set brightness to 50%, exec, brightnessctl -r"
        ];

        # +locked +repeat
        binddle = [
          ", XF86AudioRaiseVolume, Increase volume by 5%, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, Decrease volume by 5%, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

          ", XF86MonBrightnessUp, Increase brightness by 5%, exec, brightnessctl set +5%; brightnessctl -s"
          ", XF86MonBrightnessDown, Decrease brightness by 5%, exec, brightnessctl set 5%-; brightnessctl -s"
        ];

        # +locked +long-press
        binddlo = [
          ", XF86AudioNext, Next song, exec, playerctl next"
          ", XF86AudioPrev, Previous song, exec, playerctl previous"
        ] ++ lib.optional config.programs.steam.gamescopeSession.enable "$mainMod, C, Switch to gamescope session, exec, chvt ${ builtins.toString gamescope.tty }";
      };
    };
  };
}
