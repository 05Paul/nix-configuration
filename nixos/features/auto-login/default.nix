{ host, ... }:
{
  services.displayManager.autoLogin = {
    enable = true;
    user = host.user;
  };

  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };
}
