{ config, ... }: 
let
  user = config.customization.user;
in
{
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [
    "${user.name}"
  ];

  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
