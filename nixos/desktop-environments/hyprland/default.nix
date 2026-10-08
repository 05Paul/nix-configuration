{ config, pkgs, ... }: 
let
  inherit (config.customization) user;
in
{
  imports = [
    ../../features/pipewire
    ../../features/gnome-keyring
    ../../services/noctalia-greeter
  ];

  services.upower = {
    enable = true;
  };

  services.ddccontrol = {
    # enable = true; HACK: not working on newest kernel
  };
  
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      # ddcci-driver  HACK: not working on newest kernel
    ];

    kernelModules = [
      "ddcci"
      "i2c-dev"
    ];

    kernelParams = [
      "ddcci.enable_backlight=1"
    ];
  };

  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

  environment.systemPackages = with pkgs; [
    ddcutil
    brightnessctl
  ];

  users = {
    groups = {
      plugdev = {};
    };
    users."${user.name}" = {
      extraGroups = [
        "i2c"
        "plugdev"
        "video"
      ];
    };
  };

  services.logind = {
    settings.Login = {
      HandlePowerKey= "suspend";
    };
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  security.polkit = {
    enable = true;
  };

  home-manager.users."${user.name}" = {
    imports = [
      ../../../home-manager/desktop-environment/hyprland
    ];
  };
}
