{ lib, config, ... }:
{
  options.customization = {
    user = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "nixos";
        description = ''
          name of the default user
        '';
      };

      description = lib.mkOption {
        type = lib.types.str;
        default = lib.toSentenceCase config.customization.user.name;
        description = ''
          description of the default user
        '';
      };
    };

    hostname = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
      description = ''
        hostname
      '';
    };

    features = {
      battery = lib.mkEnableOption "enable battery features";
      fingerprint = lib.mkEnableOption "enable fingerprint features";
      wifi = lib.mkEnableOption "enable wifi features";
    };

    desktop = {
     tty = lib.mkOption {
        type = lib.types.int;
        default = 1;
        description = ''
          tty to use for desktop
        '';
      };
    };

    gamescope = {
      tty = lib.mkOption {
        type = lib.types.int;
        default = 2;
        description = ''
          tty to use for gamescope-session
        '';
      };
    };

    git.users = {
      personal = {
        enable = lib.mkEnableOption "enable personal user";
        signingKey = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = ''
            signing key for personal user
          '';
        };
      };

      uni = {
        enable = lib.mkEnableOption "enable uni user";
        signingKey = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = ''
            signing key for uni user
          '';
        };
      };
    };
  };
}
