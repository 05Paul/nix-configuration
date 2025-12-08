{ pkgs, lib, host, ... }:
{
  imports = [
    ./theme
  ];

  home.packages = with pkgs; [
    hyprpanel
    power-profiles-daemon
    acpi
    gnome.gvfs
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "org.gnome.Nautilus.desktop"; 
    };
  };

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
            format = "%F | %H:%M:%S %Z";
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
          ;

        };

        media = {
          show_active_only = true;
        };

        network = {
          showWifiInfo = true;
          truncation_size = 10;
        };

        notifications = {
          show_total = true;
        };

        workspaces = {
          monitorSpecific = true;
          show_numbered = true;
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

            right = {
              shortcut3 = {
                command = "screenshot";
                icon = "󰄀";
                tooltip  = "Screenshot";
              };
            };
          };
        };

        media = {
          displayTimeTooltip = true;
          displayTime = true;
        };
      };

      scalingPriority = "hyprland";

      theme = {
        bar = {
          buttons = {
            background_opacity = 70;
          };
          menus = {
            opacity = 90;
          };

          transparent = true;
        };

        font = {
          name = "JetBrainsMono Nerd Font Propo";
          label = "JetBrainsMono Nerd Font Propo";
          size = "1rem"; # make variable
        };

        notification = {
          opacity = 70;
        };
      };
    };
  };

}
