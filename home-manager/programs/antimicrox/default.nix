{ pkgs, ... }:
{
  home.packages = with pkgs; [
    antimicrox
  ];

  xdg.configFile."antimicrox/default.gamecontroller.amgp" = {
    source = ./ps4.gamecontroller.amgp;
  };
}
