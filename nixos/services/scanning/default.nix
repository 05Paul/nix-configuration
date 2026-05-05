{ pkgs, config, ... }:
let
  inherit (config.customization) user;
in
{
  hardware.sane = {
    enable = true;
    extraBackends = [ 
        pkgs.sane-airscan 
    ];
  };

  services.udev.packages = [
    pkgs.sane-airscan
  ];

  services.avahi = {
    enable = true;
    nssmdns = true;
  };

  users.users."${user.name}" = {
    packages = [
      pkgs.simple-scan
    ];

    extraGroups = [
      "scanner"
      "lp"
    ];
  };
}
