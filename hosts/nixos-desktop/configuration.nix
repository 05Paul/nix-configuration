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
      ../../bundles/multimedia
      ../../nixos/features/bootloader/limine/secureboot
      ../../nixos/features/bluetooth-wakeup
      ../../nixos/programs/flatpak/hytale
      ../../nixos/programs/steam/gamescope-session
    ];

  customization = {
    user.name = "paul";
    hostname = "nixos-desktop";
    git.users = {
      personal = {
        enable = true;
      };
    };
  };

  boot.loader.limine.extraEntries = ''
    /Windows
      protocol: efi
      path: uuid(a5df6f67-db5e-46dc-9aec-c0728a173973):/EFI/Microsoft/Boot/bootmgfw.efi
  '' ;

  boot.kernelParams = [
    "amd_iommu=on"
    "iommu=pt"
  ];

  home-manager.users."${user.name}".home = {
    stateVersion = "25.05";
  };

  
  networking.hostName = hostname;

  # NEVER CHANGE
  system.stateVersion = "25.05";
}
