{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    winboat
  ];
}
