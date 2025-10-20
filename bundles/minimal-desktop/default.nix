{ config, ... }:
  let user = config.customization.user;
in
{
  imports = [
    ../minimal
    ../../nixos/features/bluetooth
    ../../nixos/features/nerdfont
    ../../nixos/features/pipewire
    ../../nixos/programs/stylix
    ../../nixos/services/printing
  ];

  home-manager.users."${user.name}".imports = [
    ./home
  ];
}
