{ pkgs, ... }:
{
  imports = [
    ../../desktop-environment/gnome-keyring
  ];

  home.packages = with pkgs; [
    seahorse
  ];
}
