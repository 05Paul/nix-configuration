{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kopia-ui
  ];
}
