{ config, ... }:
  let user = config.customization.user;
in
{
  imports = [
    ../../nixos/programs/steam
  ];

  home-manager.users."${user.name}".imports = [
    ./home
  ];
}
