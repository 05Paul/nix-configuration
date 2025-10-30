{ config, ... }: 
let
  inherit (config.customization) user;
in
{
  nix.settings.trusted-users = [
    user.name
  ];

  home-manager.users."${user.name}" = {
    imports = [
      ../../../home-manager/programs/devenv
    ];
  };
}
