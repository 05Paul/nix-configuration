{ pkgs, ... }:
{
  imports = [
    ../rofi
  ];

  home.packages = with pkgs; [
    wl-clipboard
    xdg-utils
    cliphist
  ];

  home.file.".local/bin/clipboard" = {
    source = ./clipboard.sh;
    executable = true;
  };
}
