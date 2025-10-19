{ pkgs, ... }:
{
  imports = [
    ../../home-manager/programs/alacritty
    ../../home-manager/programs/bash
    ../../home-manager/programs/bat
    ../../home-manager/programs/bitwarden
    ../../home-manager/programs/devenv
    ../../home-manager/programs/direnv
    ../../home-manager/programs/discord
    ../../home-manager/programs/eza
    ../../home-manager/programs/firefox
    ../../home-manager/programs/fzf
    ../../home-manager/programs/nvim
    ../../home-manager/programs/git
    ../../home-manager/programs/git/credential-oauth
    ../../home-manager/programs/git/users/personal
    ../../home-manager/programs/gpg
    ../../home-manager/programs/heroic
    ../../home-manager/programs/intellij
    ../../home-manager/programs/kopia/ui
    ../../home-manager/programs/minecraft
    ../../home-manager/programs/nautilus
    ../../home-manager/programs/obsidian
    ../../home-manager/programs/onlyoffice
    ../../home-manager/programs/spotify
    ../../home-manager/programs/starship
    ../../home-manager/programs/xournalpp
    ../../home-manager/programs/yazi
    ../../home-manager/programs/zellij
    ../../home-manager/programs/zoxide
  ];

  home.packages = with pkgs; [
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
