{ config, ... }:
let
  inherit (config.customization) user;
in
{
  services.displayManager.autoLogin = {
    enable = true;
    user = user.name;
  };

  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };
}
