{ home-manager-unstable, pkgs-unstable, ...}:
let 
  monitors = [
    {
      name = "DP-1";
      height = 1440.0;
      width = 2560.0;
    }
    {
      name = "DP-2";
      height = 1440.0;
      width = 2560.0;
    }
    {
      name = "HDMI-A-2";
      height = 1080.0;
      width = 1920.0;
    }
    {
      name = "eDP-1";
      height = 1504.0;
      width = 2256.0;
    }
  ];

  forMonitors = name: widget:
    builtins.listToAttrs(
      map(monitor: {
        name = "${name}@${monitor.name}";
        value = widget monitor;
      }) monitors
    );
  
  withMonitors = widgets:
    builtins.concatMap(widget: 
      map(monitor: "${widget}@${monitor.name}") monitors
    ) widgets;
in
{
  imports = [
    (home-manager-unstable + "/modules/programs/noctalia.nix")
    ../gnome-keyring
    ../../programs/bitwarden-cli
  ];

  programs.noctalia = {
    enable = true;
    package = pkgs-unstable.noctalia;
    systemd.enable = true;
    settings = {
      bar = {
        default = {
          background_opacity = 0.0;
          capsule = true;
          capsule_opacity = 0.75;
          capsule_padding = 10.0;
          font_scale = 1.25;
          margin_ends = 10;
          thickness = 50;

          end = [
            "tray"
            "clipboard"
            "notifications"
            "bluetooth"
            "volume"
            "brightness"
            "battery"
            "session"
          ];

          start = [
            "screenshot"
            "workspaces"
            "active_window"
            "media"
            "privacy"
          ];
        };
      };

      brightness = {
        enable_ddcutil = true;
      };

      calendar = {
        enabled = true;
        account = {
          personal_google = {
            name = "Google (Personal)";
            type = "google";
          };
        };
      };

      idle = {
        behavior_order = [ 
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];

        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600.0;
          };

          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900.0;
          };

          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 600.0;
          };
        };
      };

      location = {
        auto_locate = true;
      };
  
      lockscreen = {
        wallpaper = "/home/paul/.styles/catppuccin-mocha/lockscreen.jpg";
      };
  
      lockscreen_widgets = {
        enabled = true;
        widget_order = (withMonitors [
          "login-box"
          "clock"
          "calendar"
        ]) ++
        [];
  
        widget =
          (forMonitors "login-box" (monitor: {
            box_height = 200.0;
            box_width = 800.0;
            cx = monitor.width / 2;
            cy = monitor.height / 2 - 100.0;
            output = "${monitor.name}";
            placement_height = monitor.height;
            placement_width = monitor.width;
            rotation = 0.0;
            type = "login_box";
    
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.8;
              background_radius = 12.0;
              center_password_text = true;
              input_opacity = 0.8;
              input_radius = 6.0;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = true;
              show_session_buttons = true;
              show_unlock_hint = false;
              show_weather = true;
            };
          })) // 
          (forMonitors "clock" (monitor: {
            box_height = 150.0;
            box_width = 500.0;
            cx = monitor.width / 2;
            cy = monitor.height / 2 - 450.0;
            output = "${monitor.name}";
            placement_height = monitor.height;
            placement_width = monitor.width;
            rotation = 0.0;
            type = "clock";
    
            settings = {
              background = false;
              clock_style = "digital";
              color = "on_surface";
              format = "{:%H:%M:%S}";
            };
 
          })) //
          (forMonitors "calendar" (monitor: {
            box_height = 450.0;
            box_width = 800.0;
            cx = monitor.width / 2;
            cy = monitor.height / 2 + 250.0;
            output = "${monitor.name}";
            placement_height = monitor.height;
            placement_width = monitor.width;
            rotation = 0.0;
            type = "calendar";
          })) //
        {
        };
      };

      plugins = {
        enabled = [
          "noctalia/bitwarden"
          "radimous/prismlauncher-instances"
        ];
      };

      plugin_settings = {
        "noctalia/bitwarden" = {
          clear_clipboard_seconds = 30;
          gen_passphrase_capitalize = true;
          gen_passphrase_include_number = true;
          gen_passphrase_separator = ".";
          gen_passphrase_words = 5;
        };
      };
    
      shell = {
        font_family = "JetBrainsMono NF";
        lang = "en";
        greeter_sync = {
          auto_sync = true;
        };
      };
    
      theme = {
        builtin = "Catppuccin";
        community_palette = "Catppuccin Mocha Blue";
        mode = "dark";
        source = "community";
        wallpaper_scheme = "m3-content";
    
        templates = {
          enable_builtin_templates = false;
        };
      };
    
      wallpaper = {
        directory = "/home/paul/.styles";
    
        default = {
          path = "/home/paul/.styles/catppuccin-mocha/background.jpg";
        };

        last = {
          path = "/home/paul/.styles/catppuccin-mocha/background.jpg";
        };
      };
    
      widget = {
        clock = {
          format = "{:%H:%M:%S}";
        };
      };
    };
  };
}
