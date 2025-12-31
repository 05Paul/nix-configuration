{ pkgs, config, ... }:
let 
  inherit (config.customization) user;
in
{
  home-manager.users."${user.name}" = {
    home.packages = with pkgs; [
      oversteer
      linuxKernel.packages.linux_6_12.hid-tmff2
    ];
  };
}
