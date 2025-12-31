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
      capSysNice = true;
    };

    steam.gamescopeSession = {
      enable = true;
    };
  };

  users.users."${user.name}".extraGroups = [ "input" "uinput" ];
  environment.localBinInPath = true;
/*
  services.getty.autologinUser = user.name;

  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = {
        command = "${pkgs.gamescope}/bin/gamescope -W 2560 -H 1440 -f -e --xwayland-count 2 --hdr-enabled --hdr-itm-enabled -- steam -pipewire-dmabuf -gamepadui -steamdeck -steamos3";
        user = user.name;
      };
    }
    ;
  };
*/

  systemd.services."getty@tty${ builtins.toString gamescope.tty}" = {
    overrideStrategy = "asDropin";
    serviceConfig.ExecStart = [
      ""
      ''
      @${pkgs.util-linux}/sbin/agetty agetty -o '-p -f -- \\u' --noclear --autologin ${user.name} %I $TERM
      ''
    ];
  };

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
  };

  environment = {
    loginShellInit = ''
      if [[ "$(tty)" = "/dev/tty${ builtins.toString gamescope.tty}" ]]; then
          gamescope-session; chvt ${ builtins.toString desktop.tty}; exit
      fi
    '';
  };
}
