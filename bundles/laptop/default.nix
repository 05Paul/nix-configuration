{ pkgs, ... }:
{
  imports = [
   ../../nixos/features/bootloader/limine/secureboot
   ../../nixos/features/displaylink
   ../../nixos/services/power-profiles-daemon
  ];
}
