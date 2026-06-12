{ config, ... }:
let
  inherit (config.customization) user;
in
{
  home-manager.users."${user.name}" = {
    imports = [
      ../../../home-manager/programs/spotify
    ];
  };

  networking.firewall = {
    allowedTCPPorts = [ 57621 ];
    allowedUDPPorts = [ 5353 ];
  };
}
