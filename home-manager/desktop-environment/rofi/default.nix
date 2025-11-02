{ config, lib, pkgs, ... }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
  inherit (config.lib.stylix) colors;
in
{
  stylix.targets.rofi.enable = false;

  home.packages = with pkgs; [
    wmctrl
  ];

  programs.rofi = {
    enable = true;
    modes = [
      "combi"
      "window"
      "drun"
    ];
    font = lib.mkForce "JetBrainsMono Nerd Font 18";
    extraConfig = {
      modi = "combi";
      show-icons = true;
      display-combi = "";
      display-drun = "";
      display-window = "";
    };
    terminal = "/home/paul/.nix-profile/bin/alacritty";
    theme = {
      "*" = {
        fg = mkLiteral "#${colors.base05}FF";
        fg-alt = mkLiteral "#${colors.base00}FF";
        bg = mkLiteral "#${colors.base00}87";
        bg-active = mkLiteral "#${colors.base09}AA";

        transparent = mkLiteral "#${colors.base00}00";

        brd-color = mkLiteral "#${colors.base09}FF";
        brd-none = mkLiteral "0px solid";
        brd-thin = mkLiteral "1px solid";
        brd-radius = mkLiteral "5px";
        brd-radius-l = mkLiteral "10px";

        pad = mkLiteral "5px";
        pad-prompt = mkLiteral "5px 15px 5px 5px";

        icon-size = mkLiteral "1em";
        spacing = mkLiteral "0px";
      };
      
      "listview" = {
        background-color = mkLiteral "@transparent";
        border = mkLiteral "@brd-none";
        columns = 1;
        lines = 7;
        fixed-height = true;
        fixed-columnds = true;
        cycle = false;
        scrollbar = false;
      };

      "window" = {
        background-color = mkLiteral "@bg";
        transparency = "real";
        border-radius = mkLiteral "@brd-radius-l";
        border = mkLiteral "@brd-thin";
        border-color = mkLiteral "@brd-color";
        padding = mkLiteral "@pad";
        width = mkLiteral "600px";
      };

      "mainbox" = {
        background-color = mkLiteral "@transparent";
      };

      "inputbar" = {
        background-color = mkLiteral "@transparent";
        children = map mkLiteral ["prompt" "entry"];
      };

      "prompt" = {
        background-color = mkLiteral "@transparent";
        text-color = mkLiteral "@fg";
        padding = mkLiteral "@pad-prompt";
      };

      "entry" = {
        background-color = mkLiteral  "@transparent";
        text-color = mkLiteral "@fg";
        padding = mkLiteral "@pad";
      };

      "element" = {
        background-color = mkLiteral "@transparent";
        border-radius = mkLiteral "@brd-radius";
        text-color = mkLiteral "@fg";
      };

      "element-icon" = {
        background-color = mkLiteral "@transparent";
        padding = mkLiteral "@pad";
        size = mkLiteral "@icon-size";
      };

      "element-text" = {
        background-color = mkLiteral "@transparent";
        text-color = mkLiteral "inherit";
        padding = mkLiteral "@pad";
      };

      "element normal.normal" = {
        background-color = mkLiteral "@transparent";
        text-color = mkLiteral "@fg";
      };

      "element alternate.normal" = {
        background-color = mkLiteral "@transparent";
        text-color = mkLiteral "@fg";
      };

      "element selected.active" = {
        background-color = mkLiteral "@bg-active";
        text-color = mkLiteral "@fg-alt";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@bg-active";
        text-color = mkLiteral "@fg-alt";
      };
    };
  };
}
