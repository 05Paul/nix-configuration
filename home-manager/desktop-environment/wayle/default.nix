{ config, lib, pkgs, ...}:
let
  inherit (config.customization) features;
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
            ];

            center = [
              "media"
            ];

            right = [
            ]
            ++ lib.optional features.wifi "network"
            ++
            [
              "volume"
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

        weather = {
          location = "Vienna";
        };

        window-title = {
          label-max-length = 20;
        };
      };

      styling = {
        palette = {
          bg = "#11111b";
          surface = "#181825";
          elevated = "#1e1e2e";
          fg = "#cdd6f4";
          fg-muted = "#bac2de";
          primary = "#b4befe";
          red = "#f38ba8";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          blue = "#74c7ec";
        };
      };
    };
  };
}
