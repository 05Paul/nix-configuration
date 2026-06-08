{ config, ... }:
let
  inherit (config.customization) user;
in
{
  imports = [
    ../../../home-manager/programs/alacritty
    ../../../home-manager/programs/discord
    ../../../home-manager/programs/firefox
    ../../../home-manager/programs/geogebra
    ../../../home-manager/programs/kopia/ui
    ../../../home-manager/programs/nautilus
    ../../../home-manager/programs/obsidian
    ../../../home-manager/programs/onlyoffice
    ../../../home-manager/programs/spotify
    ../../../home-manager/programs/starship
    ../../../home-manager/programs/thunderbird
    ../../../home-manager/programs/winboat
    ../../../home-manager/programs/xournalpp
    ../../../home-manager/programs/yazi
    ../../../home-manager/programs/zellij
    ../../../home-manager/programs/zoxide
    ../../../home-manager/scripts/nix-shell-templates
  ];

  home.shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake /home/${user.name}/configuration"; 
  };
}
