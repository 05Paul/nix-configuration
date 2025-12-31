{ config, ... }:
  let user = config.customization.user;
in
{
  imports = [
    ../../nixos/programs/steam
    ../../nixos/features/steering-wheel
  ];

  home-manager.users."${user.name}".imports = [
    ./home
  ];
}
