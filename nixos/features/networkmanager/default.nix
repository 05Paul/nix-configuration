{ config, pkgs, ... }:
let
  inherit (config.customization) user;
in
{
  home-manager.users."${user.name}" = {
    home.packages = with pkgs; [
      networkmanagerapplet
      networkmanager-openvpn
      openvpn
    ];
  };


  networking.networkmanager = {
    enable = true;
    plugins = [
      pkgs.networkmanager-openvpn
    ];
  };
}
