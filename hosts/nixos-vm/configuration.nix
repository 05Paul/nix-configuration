## Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, ... }:
let
  inherit (config.customization) user;
  inherit (config.customization) hostname;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../bundles/development
      ../../bundles/hyprland-desktop
      ../../bundles/gaming
      ../../bundles/laptop
      ../../nixos/programs/flatpak/streamdeck
    ];

  customization = {
    user.name = "nixos";
  };
  
  home-manager.users."${user.name}".home = {
    stateVersion = "25.05";
  };
  
  networking.hostName = hostname;

  # NEVER CHANGE
  system.stateVersion = "25.05";
}
