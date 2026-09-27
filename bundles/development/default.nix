{ config, ... }:
  let user = config.customization.user;
in
{
  imports = [
    ../../nixos/services/mesh-central
    ../../nixos/programs/devenv
    ../../nixos/virtualisation/docker
  ];

  home-manager.users."${user.name}".imports = [
    ./home
  ];
}
