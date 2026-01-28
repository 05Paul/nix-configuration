## Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, host, ... }:
let 
  inherit (config.customization) user;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../bundles/development
      ../../bundles/hyprland-desktop
      ../../bundles/gaming
      ../../bundles/laptop
      ../../bundles/studying
      ../../nixos/programs/flatpak/streamdeck
    ];

  customization = {
    user.name = host.user;
    git.users = {
      personal = {
        enable = true;
        signingKey = "749C 23E9 3F9E FCB6 5763  391D 65E5 55D7 F550 8260";
      };
      uni = {
        enable = true;
      };
    };
  };
  
  home-manager.users."${user.name}" = { 
    imports = [];

    home = {
      stateVersion = "25.05";
    };
  };
  
  networking.hostName = host.hostname;

  # NEVER CHANGE
  system.stateVersion = "25.05";
}
