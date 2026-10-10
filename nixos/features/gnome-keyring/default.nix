{ config, ... }:
let
  inherit (config.customization) user;
in
{ 
  security.pam.services = {
    login.enableGnomeKeyring = true;
    greetd = {
      enableGnomeKeyring = true;
      fprintAuth = false;
    };
  };

  home-manager.users."${user.name}" = {
    imports = [
      ../../../home-manager/desktop-environment/gnome-keyring
    ];
  };
}
