{ pkgs, config, ... }:
let 
  inherit (config.customization) user;
in
{
  hardware.steam-hardware.enable = true;

  services.udev.packages = with pkgs; [
    oversteer
  ];

  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      hid-tmff2
    ];

    kernelModules = [
      "hid-tmff2"
    ];

    blacklistedKernelModules = [
      "hid_thrustmaster"
    ];
  };

  home-manager.users."${user.name}" = {
    home.packages = with pkgs; [
      oversteer
      linuxConsoleTools
    ];
  };
}
