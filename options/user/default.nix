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
  };
}
