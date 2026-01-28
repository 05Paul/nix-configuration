{ config, ... }: 
  let user = config.customization.user;
in
{
  imports = [
    ../../nixos/features/default-user
    ../../nixos/features/locale/de_AT
    ../../nixos/features/local-bins
    ../../nixos/features/networkmanager
    ../../nixos/features/nix-experimental
    ../../nixos/features/unfree
  ];

  home-manager.users."${user.name}" = {
    imports = [
      ./home
    ];

    customization = config.customization;
  };
}
