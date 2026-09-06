{ config, pkgs, ... }:
let
  inherit (config.customization) gamescope;
  inherit (config.lib.stylix) colors;
in
{
  imports = [
    ../hyprmon
    ../hyprpaper
    ../noctalia
    ../rofi
    ../satty
    ../wvkbd
    ../../programs/antimicrox
    ../../programs/kitty
    ../../programs/resources
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

  xdg.configFile."hypr/config-monitors.lua" = {
    source = ./monitors.lua;
  };

  xdg.configFile."hypr/config-keybinds.lua" = {
    source = ./keybinds.lua;
  };

  xdg.configFile."hypr/config-windowrules.lua" = {
    source = ./windowrules.lua;
  };

  xdg.configFile."hypr/config-general.lua" = {
    source = ./config.lua;
  };

  xdg.configFile."hypr/config-input.lua" = {
    source = ./input.lua;
  };

  xdg.configFile."hypr/config-autostart.lua" = {
    source = ./autostart.lua;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraConfig = ''
      require("config-monitors")
      require("config-keybinds")
      require("config-windowrules")
      require("config-general")
      require("config-input")
      require("config-autostart")

      hl.config({
          group = {
              groupbar = {
                  text_color = "rgba(${colors.base01}ff)",
                  text_color_inactive = "rgba(${colors.base07}ff)",
                  col = {
                      active = "rgba(${colors.base07}ee)",
                      inactive = "rgba(${colors.base01}99)",
                  },
              },
          },
      })

      hl.bind(
          "SUPER + C",
          hl.dsp.exec_cmd("chvt ${ toString gamescope.tty }"),
          {
              description = "Switch to gamescope session",
              locked = true,
              long_press = true,
          }
      )
    '';
  };
}
