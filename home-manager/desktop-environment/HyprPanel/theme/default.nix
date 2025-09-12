{ config, ...}:
let
  inherit (config.lib.stylix) colors;
in
{
  # get remaining colors: cat home-manager/desktop-environment/HyprPanel/theme/default.nix | grep -e '"#......"' -o | sort | uniq --count | bat
  programs.hyprpanel.settings.theme = {
    bar = {
      background = "#${colors.base01}";

      border = {
        color = "#${colors.base07}";
      };

      buttons = {
        background = "#${colors.base02}";
        borderColor = "#${colors.base07}";
        hover = "#${colors.base03}";
        icon = "#${colors.base07}";
        icon_background = "#${colors.base02}";
        style = "default";
        text = "#${colors.base07}";

        battery = {
          background = "#${colors.base02}";
          border = "#${colors.base0A}";
          icon = "#${colors.base0A}";
          icon_background = "#${colors.base0A}";
          text = "#${colors.base0A}";
        };

        bluetooth = {
          background = "#${colors.base02}";
          border = "#${colors.base0C}";
          icon = "#${colors.base0C}";
          icon_background = "#${colors.base0C}";
          text = "#${colors.base0C}";
        };

        clock = {
          background = "#${colors.base02}";
          border = "#${colors.base0F}";
          icon = "#${colors.base0F}";
          icon_background = "#${colors.base0F}";
          text = "#${colors.base0F}";
        };

        dashboard = {
          background = "#${colors.base02}";
          border = "#${colors.base0A}";
          icon = "#${colors.base0A}";
        };

        media = {
          background = "#${colors.base02}";
          border = "#${colors.base07}";
          icon = "#${colors.base07}";
          icon_background = "#${colors.base07}";
          text = "#${colors.base07}";
        };

        modules = {
          cava = {
            background = "#${colors.base02}";
            border = "#${colors.base0C}";
            icon = "#${colors.base0C}";
            icon_background = "#${colors.base02}";
            text = "#${colors.base0C}";
          };

          cpu = {
            background = "#${colors.base02}";
            border = "#${colors.base08}";
            icon = "#${colors.base08}";
            icon_background = "#${colors.base08}";
            text = "#${colors.base08}";
          };

          hypridle = {
            background = "#${colors.base02}";
            border = "#${colors.base0F}";
            icon = "#${colors.base0F}";
            icon_background = "#${colors.base0F}";
            text = "#${colors.base0F}";
          };

          hyprsunset = {
            background = "#${colors.base02}";
            border = "#${colors.base0F}";
            icon = "#${colors.base09}";
            icon_background = "#${colors.base02}";
            text = "#${colors.base09}";
          };

          kbLayout = {
            background = "#${colors.base02}";
            border = "#${colors.base0C}";
            icon = "#${colors.base0C}";
            icon_background = "#${colors.base0C}";
            text = "#${colors.base0C}";
          };

          microphone = {
            background = "#${colors.base02}";
            border = "#${colors.base0B}";
            icon = "#${colors.base0B}";
            icon_background = "#${colors.base02}";
            text = "#${colors.base0B}";
          };

          netstat = {
            background = "#${colors.base02}";
            border = "#${colors.base0B}";
            icon = "#${colors.base0B}";
            icon_background = "#${colors.base0B}";
            text = "#${colors.base0B}";
          };

          power = {
            background = "#${colors.base02}";
            border = "#${colors.base08}";
            icon = "#${colors.base08}";
            icon_background = "#${colors.base08}";
          };

          ram = {
            background = "#${colors.base02}";
            border = "#${colors.base0A}";
            icon = "#${colors.base0A}";
            icon_background = "#${colors.base0A}";
            text = "#${colors.base0A}";
          };

          storage = {
            background = "#${colors.base02}";
            border = "#${colors.base0F}";
            icon = "#${colors.base0F}";
            icon_background = "#${colors.base0F}";
            text = "#${colors.base0F}";
          };

          submap = {
            background = "#${colors.base02}";
            border = "#${colors.base0C}";
            icon = "#${colors.base0C}";
            icon_background = "#${colors.base02}";
            text = "#${colors.base0C}";
          };

          updates = {
            background = "#${colors.base02}";
            border = "#${colors.base0E}";
            icon = "#${colors.base0E}";
            icon_background = "#${colors.base0E}";
            text = "#${colors.base0E}";
          };

          weather = {
            background = "#${colors.base02}";
            border = "#${colors.base07}";
            icon = "#${colors.base07}";
            icon_background = "#${colors.base07}";
            text = "#${colors.base07}";
          };

          worldclock = {
            background = "#${colors.base02}";
            border = "#${colors.base0F}";
            icon = "#${colors.base0F}";
            icon_background = "#${colors.base0F}";
            text = "#${colors.base0F}";
          };
        };

        network = {
          background = "#${colors.base02}";
          border = "#${colors.base0E}";
          icon = "#${colors.base0E}";
          icon_background = "#${colors.base0E}";
          text = "#${colors.base0E}";
        };

        notifications = {
          background = "#${colors.base02}";
          border = "#${colors.base07}";
          icon_background = "#${colors.base07}";
          total = "#${colors.base07}";
          icon = "#${colors.base07}";
        };

        systray = {
          background = "#${colors.base02}";
          border = "#${colors.base07}";
          customIcon = "#${colors.base05}";
        };

        volume = {
          background = "#${colors.base02}";
          border = "#${colors.base08}";
          icon = "#${colors.base08}";
          icon_background = "#${colors.base08}";
          text = "#${colors.base08}";
        };

        windowtitle = {
          background = "#${colors.base02}";
          border = "#${colors.base0F}";
          icon = "#${colors.base0F}";
          icon_background = "#${colors.base0F}";
          text = "#${colors.base0F}";
        };

        workspaces = {
          active = "#${colors.base0F}";
          available = "#${colors.base0C}";
          background = "#${colors.base02}";
          border = "#${colors.base0F}";
          hover = "#${colors.base0F}";
          numbered_active_highlighted_text_color = "#${colors.base01}";
          numbered_active_underline_color = "#${colors.base0F}";
          occupied = "#${colors.base0F}";
        };
      };


      menus = {
        background = "#${colors.base01}";
        cards = "#${colors.base00}";
        dimtext = "#${colors.base04}";
        label = "#${colors.base07}";
        feinttext = "#${colors.base02}";
        text = "#${colors.base05}";

        border = {
          color = "#${colors.base02}";
        };

        buttons = {
          active = "#${colors.base0F}";
          default = "#${colors.base07}";
          disabled = "#${colors.base04}";
          text = "#${colors.base01}";
        };

        check_radio_button = {
          active = "#${colors.base07}";
          background = "#${colors.base03}";
        };

        dropdownmenu = {
          background = "#${colors.base01}";
          divider = "#${colors.base00}";
          text = "#${colors.base05}";
        };

        iconbuttons = {
          active = "#${colors.base07}";
          passive = "#${colors.base05}";
        };

        icons = {
          active = "#${colors.base07}";
          passive = "#${colors.base04}";
        };

        listitems = {
          active = "#${colors.base07}";
          passive = "#${colors.base05}";
        };

        menu = {
          battery = {
            text = "#${colors.base05}";

            background = {
              color = "#${colors.base01}";
            };

            border = {
              color = "#${colors.base02}";
            };

            card = {
              color = "#${colors.base00}";
            };

            icons = {
              active = "#${colors.base0A}";
              passive = "#${colors.base07}";
            };

            label = { 
              color = "#${colors.base0A}";
            };

            listitems = {
              active = "#${colors.base0A}";
              passive = "#${colors.base05}";
            };

            slider = {
              background = "#${colors.base04}";
              backgroundhover = "#${colors.base03}";
              primary = "#${colors.base0A}";
              puck = "#${colors.base04}";
            }; 
          };

          bluetooth = {
            switch_divider = "#${colors.base03}";
            status = "#${colors.base04}";
            text = "#${colors.base05}";

            background = {
              color = "#${colors.base01}";
            };

            border = {
              color = "#${colors.base02}";
            };

            card = {
              color = "#${colors.base00}";
            };

            iconbutton = {
              active = "#${colors.base0C}";
              passive = "#${colors.base05}";
            };

            icons = {
              active = "#${colors.base0C}";
              passive = "#${colors.base07}";
            };

            label = {
              color = "#${colors.base0C}";
            };

            listitems = {
              active = "#${colors.base0C}";
              passive = "#${colors.base05}";
            };

            scroller = {
              color = "#${colors.base0C}";
            };

            switch = {
              disabled = "#${colors.base02}";
              enabled = "#${colors.base0C}";
              puck = "#${colors.base03}";
            };
          };

          clock = {
            text = "#${colors.base05}";

            background = {
              color = "#${colors.base01}";
            };

            border = {
              color = "#${colors.base02}";
            };

            calendar = {
              contextdays = "#${colors.base04}";
              currentday = "#${colors.base0F}";
              days = "#${colors.base05}";
              paginator = "#${colors.base0F}";
              weekdays = "#${colors.base0F}";
              yearmonth = "#${colors.base0C}";
            };

            card = {
              color = "#${colors.base00}";
            };

            time = {
              timeperiod = "#${colors.base0C}";
              time = "#${colors.base0F}";
            };

            weather = {
              icon = "#${colors.base0F}";
              stats = "#${colors.base0F}";
              status = "#${colors.base0C}";
              temperature = "#${colors.base05}";

              hourly = {
                icon = "#${colors.base0F}";
                temperature = "#${colors.base0F}";
                time = "#${colors.base0F}";
              };

              thermometer = {
                cold = "#${colors.base0D}";
                extremelycold = "#${colors.base0C}";
                extremelyhot = "#${colors.base08}";
                hot = "#${colors.base09}";
                moderate = "#${colors.base07}";
              };
            };
          };

          dashboard = {
            background = {
              color = "#${colors.base01}";
            };

            border = {
              color = "#${colors.base02}";
            };

            card = {
              color = "#${colors.base00}";
            };

            controls = {
              disabled = "#${colors.base04}";

              input = {
                background = "#${colors.base0F}";
                text = "#${colors.base01}";
              };

              volume = {
                text = "#${colors.base01}";
                background = "#${colors.base08}";
              };
              notifications = {
                background = "#${colors.base0A}";
                text = "#${colors.base01}";
              };

              bluetooth = {
                background = "#${colors.base0C}";
                text = "#${colors.base01}";
              };

              wifi = {
                text = "#${colors.base01}";
                background = "#${colors.base0E}";
              };
            };

            directories = {
              left = {
                bottom = {
                  color = "#${colors.base08}";
                };

                middle = {
                  color = "#${colors.base0A}";
                };

                top = {
                  color = "#${colors.base0F}";
                };
              };

              right = {
                bottom = {
                  color = "#${colors.base07}";
                };

                middle = {
                  color = "#${colors.base0E}";
                };

                top = {
                  color = "#${colors.base0C}";
                };
              };
            };

            monitors = {
              bar_background = "#${colors.base03}";

              cpu = {
                label = "#${colors.base08}";
                bar = "#${colors.base08}";
                icon = "#${colors.base08}";
              };

              disk = {
                bar = "#${colors.base0F}";
                icon = "#${colors.base0F}";
                label = "#${colors.base0F}";
              };

              gpu = {
                bar = "#${colors.base0B}";
                icon = "#${colors.base0B}";
                label = "#${colors.base0B}";
              };

              ram = {
                bar = "#${colors.base0A}";
                icon = "#${colors.base0A}";
                label = "#${colors.base0A}";
              };
            };

            powermenu = {
              logout = "#${colors.base0B}";
              restart = "#${colors.base09}";
              shutdown = "#${colors.base08}";
              sleep = "#${colors.base0C}";

              confirmation = {
                background = "#${colors.base01}";
                body = "#${colors.base05}";
                border = "#${colors.base02}";
                button_text = "#${colors.base01}";
                card = "#${colors.base00}";
                confirm = "#${colors.base0B}";
                deny = "#${colors.base08}";
                label = "#${colors.base07}";
              };
            };

            profile = {
              name = "#${colors.base0F}";
            };

            shortcuts = {
              recording = "#${colors.base0B}";
              text = "#${colors.base01}";
              background = "#${colors.base07}";
            };
          }; 

          media = {
            album = "#${colors.base0F}";
            artist = "#${colors.base0C}";
            song = "#${colors.base07}";
            timestamp = "#${colors.base05}";

            background = {
              color = "#${colors.base01}";
            };

            border = {
              color = "#${colors.base02}";
            };

            card = {
              color = "#${colors.base00}";
            };

            buttons = {
              background = "#${colors.base07}";
              enabled = "#${colors.base0C}";
              inactive = "#${colors.base04}";
              text = "#${colors.base01}";
            };

            slider = {
              background = "#${colors.base04}";
              backgroundhover = "#${colors.base03}";
              primary = "#${colors.base0F}";
              puck = "#${colors.base04}";
            };
          };

          network = {
            text = "#${colors.base05}";

            background = {
              color = "#${colors.base01}";
            };

            border = {
              color = "#${colors.base02}";
            };

            card = {
              color = "#${colors.base00}";
            };
            
            icons = {
              active = "#${colors.base0E}";
              passive = "#${colors.base07}";
            };

            iconbuttons = {
              active = "#${colors.base0E}";
              passive = "#${colors.base05}";
            };

            label = {
              color = "#${colors.base0E}";
            };

            listitems = {
              active = "#${colors.base0E}";
              passive = "#${colors.base05}";
            };

            scroller = {
              color = "#${colors.base0E}";
            };

            status = {
              color = "#${colors.base04}";
            };

            switch = {
              enabled = "#${colors.base0E}";
              disabled = "#${colors.base02}";
              puck = "#${colors.base03}";
            };
          };

          notifications = {
            background = "#${colors.base01}";
            border = "#${colors.base02}";
            card = "#${colors.base00}";
            clear = "#${colors.base08}";
            label = "#${colors.base07}";
            no_notifications_label = "#${colors.base02}";
            switch_divider = "#${colors.base03}";

            pager = {
              background = "#${colors.base01}";
              button = "#${colors.base07}";
              label = "#${colors.base07}";
            };

            scrollbar = {
              color = "#${colors.base07}";
            };

            switch = {
              disabled = "#${colors.base02}";
              enabled = "#${colors.base07}";
              puck = "#${colors.base03}";
            };
          };

          power = {
            background = {
              color = "#${colors.base01}";
            };

            border = {
              color = "#${colors.base02}";
            };

            buttons = {
              logout = {
                background = "#${colors.base00}";
                icon = "#${colors.base01}";
                icon_background = "#${colors.base0B}";
                text = "#${colors.base0B}";
              };

              restart = {
                background = "#${colors.base00}";
                icon = "#${colors.base01}";
                icon_background = "#${colors.base09}";
                text = "#${colors.base09}";
              };

              shutdown = {
                background = "#${colors.base00}";
                icon = "#${colors.base01}";
                icon_background = "#${colors.base08}";
                text = "#${colors.base08}";
              };

              sleep = {
                background = "#${colors.base00}";
                icon = "#${colors.base01}";
                icon_background = "#${colors.base0C}";
                text = "#${colors.base0C}";
              };
            };
          };

          systray = {
            dropdownmenu = {
              background = "#${colors.base01}";
              divider = "#${colors.base00}";
              text = "#${colors.base05}";
            };
          };

          volume = {
            text = "#${colors.base05}";

            audio_slider = {
              background = "#${colors.base04}";
              backgroundhover = "#${colors.base03}";
              primary = "#${colors.base08}";
              puck = "#${colors.base04}";
            };

            background = {
              color = "#${colors.base01}";
            };

            border = {
              color = "#${colors.base02}";
            };

            card = {
              color = "#${colors.base00}";
            };

            iconbutton = {
              active = "#${colors.base08}";
              passive = "#${colors.base05}";
            };

            icons = {
              active = "#${colors.base08}";
              passive = "#${colors.base07}";
            };

            input_slider = {
              background = "#${colors.base04}";
              backgroundhover = "#${colors.base03}";
              primary = "#${colors.base08}";
              puck = "#${colors.base04}";
            };

            label = {
              color = "#${colors.base08}";
            };

            listitems = {
              active = "#${colors.base08}";
              passive = "#${colors.base05}";
            };
          };
        };

        popover = {
          background = "#${colors.base01}";
          border = "#${colors.base01}";
          text = "#${colors.base07}";
        };

        progressbar = {
          background = "#${colors.base03}";
          foreground = "#${colors.base07}";
        };

        slider = {
          background = "#${colors.base04}";
          backgroundhover = "#${colors.base03}";
          primary = "#${colors.base07}";
          puck = "#${colors.base04}";
        };

        tooltip = {
          background = "#${colors.base01}";
          text = "#${colors.base05}";
        };

        switch = {
          disabled = "#${colors.base02}";
          enabled = "#${colors.base07}";
          puck = "#${colors.base03}";
        };
      };
    }; 

    notification = {
      background = "#${colors.base01}";
      border = "#${colors.base02}";
      label = "#${colors.base07}";
      labelicon = "#${colors.base07}";
      text = "#${colors.base05}";
      time = "#${colors.base04}";

      actions = {
        background = "#${colors.base07}";
        text = "#${colors.base01}";
      };

      close_button = {
        background = "#${colors.base08}";
        label = "#${colors.base01}";
      };
    };

    osd = {
      bar_color = "#${colors.base07}";
      bar_container = "#${colors.base01}";
      bar_empty_color = "#${colors.base02}";
      bar_overflow_color = "#${colors.base08}";
      icon = "#${colors.base01}";
      icon_container = "#${colors.base07}";
      label = "#${colors.base07}";
    };
  };
}
