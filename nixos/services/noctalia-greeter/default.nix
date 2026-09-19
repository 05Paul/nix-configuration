{ config, ... }:
let
  inherit (config.customization) user;
in
{
  services.displayManager.noctalia-greeter = {
    enable = true;
    passwordless-sync-users = [ 
      "${user.name}"
    ];
    settings = {
      appearance = {
        hide_logo = true;
      };
    };
  };
}
