{ pkgs, config, ...}:
let
  inherit (config.customization) user;
in
{
  home-manager.users."${user.name}" = {
    services.gnome-keyring.enable = true;
    home.packages = with pkgs; [
      gcr
    ];
  };

  environment.systemPackages = with pkgs; [
    bitwarden-desktop
    seahorse
  ];
}
