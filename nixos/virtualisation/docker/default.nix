{ config, ... }:
let
  inherit (config.customization) user;
in
{
  virtualisation.docker = {
    enable = true;
  };

  users.users.${user.name} = {
    extraGroups = [
      "docker"
    ];
  };
}
