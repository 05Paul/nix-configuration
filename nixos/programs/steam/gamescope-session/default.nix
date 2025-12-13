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

  environment.localBinInPath = true;

  systemd.services."getty@tty${ builtins.toString gamescope.tty}" = {
    overrideStrategy = "asDropin";
    serviceConfig.ExecStart = [
      ""
      ''
      @${pkgs.util-linux}/sbin/agetty agetty -o '-p -f -- \\u' --noclear --autologin ${user.name} %I TERM
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
