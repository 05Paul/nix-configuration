{ config, pkgs, ... }:
let
  inherit (config.customization) user;
  inherit (config.customization) hostname;
in 
{
  imports =
    [ # Include the results of the hardware scan.
      ../../nixos/features/bootloader/systemd-boot
      ../../nixos/features/locale/de_AT
      ../../nixos/features/nix-experimental
      ../../options/user
    ];

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  users.users."${user.name}" = {
    isNormalUser = true;
    description = user.description;
    extraGroups = 
      [ 
        "networkmanager"
        "wheel"
      ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  ];

  services.openssh.enable = true;
  networking.firewall.enable = false;
}
