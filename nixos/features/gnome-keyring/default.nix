{ config, ... }:
let
  inherit (config.customization) user;
in
{ 
  security.pam.services.login.enableGnomeKeyring = true;

  home-manager.users."${user.name}" = {
    imports = [
      ../../../home-manager/desktop-environment/gnome-keyring
    ];
  };
}
