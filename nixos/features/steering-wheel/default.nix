{ pkgs, config, ... }:
let 
  inherit (config.customization) user;
  tm300rs-setup = pkgs.writeShellScript "tm300rs-setup" ''
    DEVICE="$1"
    ${pkgs.linuxConsoleTools}/bin/evdev-joystick --e "$DEVICE" --axis 1 --minimum 100 --maximum 1021
    ${pkgs.linuxConsoleTools}/bin/evdev-joystick --e "$DEVICE" --axis 2 --minimum 140 --maximum 1021
    ${pkgs.linuxConsoleTools}/bin/evdev-joystick --e "$DEVICE" --axis 5 --minimum 0 --maximum 1021
  '';
in
{
  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    linuxConsoleTools
  ];

  services.udev = {
    packages = with pkgs; [
      oversteer
    ];

    extraRules = ''
      ACTION=="add", SUBSYSTEM=="input", ATTRS{idVendor}=="044f", ATTRS{idProduct}=="b66e", \
        ENV{ID_INPUT_JOYSTICK}=="1", \
        RUN+="${tm300rs-setup} %E{DEVNAME}"
    '';
  };

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
