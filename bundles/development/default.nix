{ config, ... }:
  let user = config.customization.user;
in
{
  imports = [
    ../../nixos/programs/devenv
    ../../nixos/virtualisation/docker
    ../../nixos/virtualisation/virt-manager
  ];

  home-manager.users."${user.name}".imports = [
    ./home
  ];
}
