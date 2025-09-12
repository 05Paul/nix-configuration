{ pkgs, lib, host, ... }:
{
  imports = [
    ./theme
  ];

  home.packages = with pkgs; [
    hyprpanel
  ];

  programs.hyprpanel = {
    enable = true;
    systemd.enable = false;
    settings = {
      bar = {
        autoHide = "fullscreen";
        battery = {
          hideLabelWhenFull = true;
        };

        clock = {
          format = "%a %b %d  %H:%M:%S";
        };

        customModules = {
          kbLayout = {
            leftClick = "hyprctl switchxkblayout all next";
            rightClick = "hyprctl switchxkblayout all prev";
          };

          microphone = {
            label = true;
          };

          storage.paths = [
            "/"
          ];

          worldclock = {
            formatDiffDate = "%a %b %d  %H:%M:%S %Z";
            format = "%H:%M:%S %Z";
            tz = [
              "Europe/Vienna"
            ];
          };
        };

        launcher = {
          autoDetectIcon = true;
          rightClick = "menu:powerdropdown";
        };

        layouts."*" = {
          left = [
            "dashboard"
            "workspaces"
            "windowtitle"
            "kbinput"
          ];

          middle = [
            "media"
          ];

          right = [
            "volume"
          ] 
          ++ lib.optional host.features.wifi "network"
          ++
          [
            "bluetooth"
            "worldclock"
            "notifications"
          ]
          ++ lib.optional host.features.battery "battery"
          ++
          [
            "custom/lock"
          ]
          ;

        };

        media = {
          show_active_only = true;
        };

        network = {
          showWifiInfo = false;
        };

        notifications = {
          show_total = true;
        };

        workspaces = {
          monitorSpecific = true;
#          show_icons = false;
          show_numbered = true;
#          showWsIcons = false;
#          workspaceMask = false;
          numbered_active_indicator = "highlight";
        };
      };

      menus = {
        clock = {
          hideSeconds = false;
          time.military = true; 
          weather.enabled = false;
        };

        dashboard = {
          shortcuts = {
            left = {
              shortcut1 = {
                command = "firefox";
                icon = "";
                tooltip = "Firefox";
              };

              shortcut2 = {
                command = "rofi -show drun";
                icon = "";
                tooltip = "Search Apps";
              };

              shortcut3 = {
                command = "hyprfocus discord || discord";
              };

              shortcut4 = {
                command = "hyprfocus Spotify || spotify";
                icon = "";
                tooltip = "Spotify";
              };
            };
          };
        };

        media = {
          displayTimeTooltip = true;
          displayTime = true;
        };
      };

      theme = {
        bar = {
       # "theme.bar.floating": false,
       # "theme.bar.enableShadow": false,
       # "theme.bar.buttons.media.enableBorder": false,
          buttons = {
            background_opacity = 70;
          };
          menus = {
            opacity = 90;
          };

          transparent = true;
        };

        font = {
          name = "JetBrainsMono Nerd Font";
          label = "JetBrainsMono Nerd Font";
        };

        notification = {
          opacity = 70;
        };
      };
    };
  };

}
