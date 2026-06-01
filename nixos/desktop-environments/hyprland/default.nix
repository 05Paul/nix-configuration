{ config, pkgs, lib, ... }: 
let
  inherit (config.customization) user;
  inherit (config.customization) desktop;
  inherit (config.customization) gamescope;
  inherit (config.lib.stylix) colors;
in
{
  imports = [
    ../../features/pipewire
  ];

  services.greetd = {
    enable = true;
    settings = {
      terminal = {
        vt = desktop.tty;
      };
      default_session = {
        command = "${pkgs.greetd}/bin/agreety --cmd Hyprland";
        user = "${user.name}";
      };

      initial_session = {
        command = "Hyprland";
        user = "${user.name}";
      };
    };
  };

  services.upower = {
    enable = true;
  };

  services.ddccontrol = {
    enable = true;
  };
  
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      ddcci-driver
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
