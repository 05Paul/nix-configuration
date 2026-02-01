{ pkgs, lib, config, ... }:
let
  inherit (config.lib.stylix) colors;
  inherit (config.customization) features;
  utils = import ./utils.nix { inherit lib; };
in
{
  home.packages = with pkgs; [
    playerctl
    imagemagick
  ];

  xdg.configFile."hypr/scripts/media-image.sh" = {
    source = ./media-image.sh;
    executable = true;
  };

  xdg.configFile."hypr/scripts/media-progress.sh" = {
    source = ./media-progress.sh;
    executable = true;
  };

  xdg.configFile."hypr/scripts/media-artist.sh" = {
    source = ./media-artist.sh;
    executable = true;
  };

  xdg.configFile."hypr/scripts/media-title.sh" = {
    source = ./media-title.sh;
    executable = true;
  };

  home.file.".styles/catppuccin-mocha/lockscreen.jpg" = {
    source = ../../../styles/catppuccin-mocha/lockscreen.jpg;
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      "$font" = "Monospace";
      "$textColor" = utils.hexToRGBACall {
        hex = colors.base05;
      };

      auth = {
        "fingerprint:enabled" = features.fingerprint;
      };

      input-field = {
        monitor = "";
        fade_on_empty = false;
        placeholder_text = "Password";
        inner_color = lib.mkForce (utils.hexToRGBACall {
          hex = colors.base00;
          opacity = 0.75;
        });

        size = "20%, 5%";
        position = "0, -20";
        halign = "center";
        valign = "center";
      };

      background = {
        monitor = "";
        # TODO make into option
        path = lib.mkForce "~/.styles/catppuccin-mocha/lockscreen.jpg";
        blur_passes = 2;
        blur_size = 3;
      };

      label = [
        # User
        {
          monitor = "";
          text = "$DESC";
          font_size = 25;
          font_family = "$font";
          color = "$textColor";

          position = "0, 50";
          halign = "center";
          valign = "center";
        }

        # Time
        {
          monitor = "";
          text = "$TIME";
          font_size = 90;
          font_family = "$font";
          color = "$textColor";
          
          position = "0, 0";
          halign = "center";
          valign = "top";
        }

        # Date
        {
          monitor = "";
          text = ''cmd[update:60000] date +"%A, %d %B %Y"'';
          font_size = 25;
          font_family = "$font";
          color = "$textColor";

          position = "0, -150";
          halign = "center";
          valign = "top";
        }

        # Media - title
        {
          monitor = "";
          text = "cmd[update:1000] ~/.config/hypr/scripts/media-title.sh";
          font_size = 20;
          font_family = "$font";
          color = "$textColor";

          position = "-150, 100";
          halign = "right";
          valign = "bottom";
        }

        # Media - artist
        {
          monitor = "";
          text = "cmd[update:1000] ~/.config/hypr/scripts/media-artist.sh";
          font_size = 20;
          font_family = "$font";
          color = "$textColor";

          position = "-150, 60";
          halign = "right";
          valign = "bottom";
        }

        # Media - status - progress
        {
          monitor = "";
          text = "cmd[update:1000] ~/.config/hypr/scripts/media-progress.sh";
          font_size = 20;
          font_family = "$font";
          color = "$textColor";

          position = "-150, 20";
          halign = "right";
          valign = "bottom";
        }

        # Layout
        {
          monitor = "";
          text = "$LAYOUT";
          font_size = 20;
          color = "$textColor";

          position = "20, 20";
          halign = "left";
          valign = "bottom";
        }
      ];

      image = [
        {
          monitor = "";
          path = "/tmp/hyprlock/latest.png";
          reload_time = 5;
          reload_cmd = "~/.config/hypr/scripts/media-image.sh";
          rounding = 10;
          border_size = 1;
          border_color = utils.hexToRGBACall {
            hex = colors.base0D;
            opacity = 0.0;
          };

          size = 120;
          position = "-20, 20";
          halign = "right";
          valign = "bottom";
        }
      ];

      shape = [
        {
          monitor = "";
          rounding = 10;
          color = utils.hexToRGBACall {
            hex = colors.base00;
            opacity = 0.75;
          };
          border_size = 1;
          border_color = utils.hexToRGBACall {
            hex = colors.base0D;
          };

          size = "400, 120";
          position = "-20, 20";
          halign = "right";
          valign = "bottom";
        }
      ];
    };
  };
}
