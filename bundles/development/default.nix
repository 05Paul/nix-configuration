{ config, ... }:
  let user = config.customization.user;
in
{
  imports = [
    ../../nixos/programs/devenv
  ];

  home-manager.users."${user.name}".imports = [
    ./home
  ];
}
