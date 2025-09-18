{ config, hyprshell, ... }: 
let
  inherit (config.lib.stylix) colors;
in
{
  imports = [
    hyprshell.homeModules.hyprshell
  ];

  programs.hyprshell = {
    enable = true;
    systemd.enable = false;
    systemd.args = "-vv";
    settings = {
      windows = {
        enable = true;
        overview = {
          enable = true;
          key = "super_l";
          modifier = "super";
          launcher = {
            max_items = 5;
            default_terminal = "kitty";
            plugins.websearch = {
                enable = true;
                engines = [{
                    name = "DuckDuckGo";
                    url = "https://duckduckgo.com/?q={}";
                    key = "g";
                }];
            };
            plugins.path.enable = true;
          };
        };
        switch = {
          enable = true;
        };
      };
    };

    styleFile = ''
      :root {
          --border-color: #${colors.base0A}00;
          --border-color-active: #${colors.base09}FF;

          --bg-color: #${colors.base00}03;
          --bg-color-hover: #${colors.base00}2D;

          --border-radius: 24px;
          --border-size: 1px;
          --border-style: solid;

          --text-color: #${colors.base05}FF;

          --window-padding: 2px;
      }

      /*
      .monitor {
      }
      */

      .workspace {
        border: unset;
      }

      /*
      .workspace.active {}

      .workspace:hover {}
      */

      .client {
        border: unset;
      }

      .client.active {
        border: var(--border-size) var(--border-style) var(--border-color-active);
      }

      /*
      .client:hover {}

      .client-image {}
      */

      .launcher {
          border: unset;
      }

      .launcher-input {
          border-radius: 12px;
      }

      .launcher-input:focus-within {
          outline: var(--border-size, 3px) var(--border-style, solid) var(--border-color-active);
      }

      /*
      .launcher-results {}
      */

      .launcher-item {
          padding: 0 10px;
          border-radius: 16px;
          background: none;
      }

      /*
      .launcher-item:hover {}

      .launcher-exec {}

      .launcher-key {}

      .launcher-plugins {}
      */

      .launcher-plugin {
          padding: 8px;
      }

      /*
      .launcher-plugin:hover {}
      */
    '';
  };
}
