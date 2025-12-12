{ config, ... }:
let
   inherit (config.customization) user;
in
{
  imports = [
    ../minimal
    ../../nixos/features/automount-usb
    ../../nixos/features/bluetooth
    ../../nixos/features/nerdfont
    ../../nixos/features/pipewire
    ../../nixos/programs/bitwarden-desktop
    ../../nixos/programs/localsend
    ../../nixos/programs/stylix
    ../../nixos/services/printing
  ];

  home-manager.users."${user.name}".imports = [
    ./home
  ];
}
