# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../bundles/homelab
    ];

  customization = {
    user.name = "nixos";
    hostname = "nixos-compute-2";
  };

  # NEVER CHANGE
  system.stateVersion = "25.11";
}
