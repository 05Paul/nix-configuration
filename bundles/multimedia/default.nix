{ config, ... }:
let
  inherit (config.customization) user;
in
{
  home-manager.users."${user.name}".imports = [
    ./home
  ];
}
