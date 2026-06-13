{ config, lib, pkgs, ...}:
let
  inherit (config.customization) features;
  inherit (config.lib.stylix) colors;
in
{
  home.packages = with pkgs; [
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


  services.wayle = {
    enable = true;
    settings = {
      general = {
        font-sans = "JetBrainsMono Nerd Font Mono";
      };

      bar = {
        bg = "transparent";
        button-opacity = 90;
        button-variant = "basic";
        dropdown-opacity = 90;

        layout = [
          {
            monitor = "*";

            left = [
              "dashboard"
              "hyprland-workspaces"
              "window-title"
              "systray"
              "volume"
            ];

            center = [
              "media"
            ];

            right = [
            ]
            ++ lib.optional features.wifi "network"
            ++
            [
              "bluetooth"
              "idle-inhibit"
              "clock"
              "notifications"
            ] ++ lib.optional features.battery "battery"
            ;
          }
        ];
      };

      modules = {
        bluetooth = {
          label-show = false;
        };

        clock = {
          format = "%d-%m-%Y %H:%M:%S";
          dropdown-show-seconds = true;
        };

        hyprland-workspaces = {
          monitor-specific = false;
          app-icons-show = true;
          workspace-ignore = [
            "-99"
          ];
        };

        idle-inhibit = {
          label-show = false;
        };

        weather = {
          location = "Vienna";
        };

        window-title = {
          label-max-length = 20;
        };
      };

      styling = {
        palette = {
          bg = "#${colors.base00}";
          surface = "#${colors.base00}";
          elevated = "#${colors.base01}";
          fg = "#${colors.base05}";
          fg-muted = "#${colors.base0E}";
          primary = "#${colors.base07}";
          red = "#${colors.base08}";
          yellow = "#${colors.base0A}";
          green = "#${colors.base0B}";
          blue = "#${colors.base0D}";
        };
      };
    };
  };
}
