{ config, ... }:
let
  inherit (config.customization) user;
in
{
  programs.noctalia-greeter = {
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
