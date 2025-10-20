{ ... }:
{
  imports = [
   ../../nixos/features/bootloader/systemd-boot
   ../../nixos/features/displaylink
   ../../nixos/services/power-profiles-daemon
  ];
}
