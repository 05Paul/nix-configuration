## Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ host, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../bundles/development
      ../../bundles/hyprland-desktop
      ../../bundles/gaming
      ../../nixos/features/bootloader/grub
      ../../nixos/programs/steam/gamescope-session
    ];

  customization = {
    user.name = host.user;
  };

  
  networking.hostName = host.hostname;

  # NEVER CHANGE
  system.stateVersion = "25.05";
}
