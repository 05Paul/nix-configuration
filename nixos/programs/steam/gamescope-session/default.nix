{ pkgs, config, ... }:
let
  inherit (config.customization) user;
  inherit (config.customization) desktop;
  inherit (config.customization) gamescope;
in
{
  imports = [
    ../../steam
  ];

  environment.systemPackages = with pkgs; [
    mangohud
  ];

  boot.kernelPackages = pkgs.linuxPackages;

  programs = {
    gamescope = {
      enable = true;
      capSysNice = false;
    };

    steam.gamescopeSession = {
      enable = true;
      args = [
        "-W 2560"
        "-H 1440"
        "-f"
        "-e"
        "--expose-wayland"
        "--adaptive-sync"
        "--hdr-enabled"
        "--hdr-itm-enabled"
        "--mangoapp"
        "--rt"
        "--xwayland-count 2"
        "--steam"
      ];
      env = {
        MANGOHUD = "1";
        MANGOHUD_CONFIG = "no_display,cpu_temp,gpu_temp,ram,vram";
      };
      steamArgs = [
        "-pipewire-dmabuf"
        "-gamepadui"
        "-steamdeck"
        "-steamos3"
      ];
    };
  };

  users.users."${user.name}".extraGroups = [ "input" "uinput" ];
  environment.localBinInPath = true;

  home-manager.users."${user.name}" = { ... }: {
    home.file.".local/bin/gamescope-session" = {
      source = ./bins/gamescope-session;
      executable = true;
    };

    # Script to enable "Quit to Desktop"
    home.file.".local/bin/steamos-session-select" = {
      source = ./bins/steamos-session-select;
      executable = true;
    };

    home.file.".local/bin/steamos-select-branch" = {
      source = ./bins/steamos-select-branch;
      executable = true;
    };

    home.file.".local/bin/steamos-update" = {
      source = ./bins/steamos-update;
      executable = true;
    };

    home.file.".local/bin/jupiter-biosupdate" = {
      source = ./bins/jupiter-biosupdate;
      executable = true;
    };

    xdg.configFile."gamescope/scripts/gamescope-session" = {
      source = ./bins/gamescope-session;
      executable = true;
    };

    # Script to enable "Quit to Desktop"
    xdg.configFile."gamescope/scripts/steamos-session-select" = {
      source = ./bins/steamos-session-select;
      executable = true;
    };

    xdg.configFile."gamescope/scripts/steamos-select-branch" = {
      source = ./bins/steamos-select-branch;
      executable = true;
    };

    xdg.configFile."gamescope/scripts/steamos-update" = {
      source = ./bins/steamos-update;
      executable = true;
    };

    xdg.configFile."gamescope/scripts/jupiter-biosupdate" = {
      source = ./bins/jupiter-biosupdate;
      executable = true;
    };
  };
}
