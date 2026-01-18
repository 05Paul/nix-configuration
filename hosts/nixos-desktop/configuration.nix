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
      ../../nixos/features/bootloader/limine/secureboot
      ../../nixos/features/bluetooth-wakeup
      ../../nixos/programs/steam/gamescope-session
    ];

  customization = {
    user.name = host.user;
  };

  boot.loader.limine.extraEntries = ''
    /Windows
      protocol: efi
      path: uuid(0f1c46b0-4adc-453b-b1fb-c2de14670107):/EFI/Microsoft/Boot/bootmgfw.efi
  '' ;

  boot.kernelParams = [
    "amd_iommu=on"
    "iommu=pt"
  ];

  home-manager.users."${user.name}".home = {
    stateVersion = "25.05";
  };

  
  networking.hostName = host.hostname;

  # NEVER CHANGE
  system.stateVersion = "25.05";
}
