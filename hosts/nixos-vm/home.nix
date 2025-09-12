{ pkgs, ... }:
{
  imports = [
    ../../home-manager/programs/alacritty
    ../../home-manager/programs/bash
    ../../home-manager/programs/direnv
    ../../home-manager/programs/nvim
    ../../home-manager/programs/spotify
    ../../home-manager/programs/starship
    ../../home-manager/programs/yazi
    ../../home-manager/programs/zellij
  ];

  home.packages = [
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
         enabled-extensions = [
           pkgs.gnomeExtensions.user-themes.extensionUuid
         ];
      };
    };
  };

  home = {
    username = "paul";
    homeDirectory = "/home/paul";
    stateVersion = "25.05";
  };
}
