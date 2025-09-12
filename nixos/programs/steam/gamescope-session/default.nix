{ pkgs, host, ... }:
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

  systemd.services."getty@tty3" = {
    overrideStrategy = "asDropin";
    serviceConfig.ExecStart = [
      ""
      ''
      @${pkgs.util-linux}/sbin/agetty agetty -o '-p -f -- \\u' --noclear --autologin ${host.user} %I TERM
      ''
    ];
  };

  home-manager.users."${host.user}" = { ... }: {
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
      if [[ "$(tty)" = "/dev/tty3" ]]; then
          gamescope-session; chvt 2; exit
      fi
    '';
  };
}
