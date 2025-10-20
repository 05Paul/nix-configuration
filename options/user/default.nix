{ lib, options, ... }:
{
  options.customization.user = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
      description = ''
        name of the default user
      '';
    };

    description = lib.mkOption {
      type = lib.types.str;
      default = lib.toSentenceCase options.customization.user.name;
      description = ''
        description of the default user
      '';
    };
  };
}
