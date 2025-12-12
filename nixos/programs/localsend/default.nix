{ pkgs, config, ... }:
let
  inherit (config.customization) user;
in
{
  home-manager.users."${user.name}" = {
    home.packages = with pkgs; [
        localsend
    ];
  };

  networking.firewall = {
    allowedTCPPorts = [
      53317
    ];

    allowedUDPPorts = [
      53317
    ];
  };
}
