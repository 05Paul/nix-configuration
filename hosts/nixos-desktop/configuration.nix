## Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, host, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../nixos/desktop-environments/hyprland
 #     ../../nixos/desktop-environments/kde
      ../../nixos/features/bluetooth
      ../../nixos/features/bootloader/grub
      ../../nixos/features/locale/de_AT
      ../../nixos/features/pipewire
      ../../nixos/programs/flatpak/streamdeck
      ../../nixos/programs/steam/gamescope-session
      ../../nixos/programs/stylix
      ../../nixos/services/printing
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  
  networking.hostName = host.hostname;
  networking.networkmanager.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${host.user}" = {
    isNormalUser = true;
    description = "Paul";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [
    ];
  };


  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
  ];

  # NEVER CHANGE
  system.stateVersion = "25.05";
}
