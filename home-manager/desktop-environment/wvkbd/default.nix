{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wvkbd
  ];

  home.file.".local/bin/toggle_osk" = {
    source = ./toggle.sh;
    executable = true;
  };
}
