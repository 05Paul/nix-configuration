{ pkgs, config, ...}:
let
  inherit (config.customization) user;
in
{
  home-manager.users."${user.name}" = {
    imports = [
      ../../../home-manager/desktop-environment/gnome-keyring
      ../../../home-manager/programs/seahorse
    ];
  };

  environment.systemPackages = with pkgs; [
    bitwarden-desktop
  ];
}
