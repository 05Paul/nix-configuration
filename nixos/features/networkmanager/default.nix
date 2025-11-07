{ config, pkgs, ... }:
let
  inherit (config.customization) user;
in
{
  home-manager.users."${user.name}" = {
    home.packages = with pkgs; [
      networkmanagerapplet
    ];
  };


  networking.networkmanager = {
    enable = true;
  };
}
