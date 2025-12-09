{ config, pkgs, ... }:
let
  inherit (config.customization) user;
in
{
  services.udisks2.enable = true;

  home-manager.users."${user.name}" = {
    home.packages = with pkgs; [
      gnome-disk-utility
    ];

    services.udiskie = {
      enable = true;

      settings = {
        program_options = {
          file_manager = "${pkgs.nautilus}/bin/nautilus";
        };
      };
    };
  };
}
