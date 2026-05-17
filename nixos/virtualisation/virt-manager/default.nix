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

  networking.bridges.br0 = {
    interfaces = [
      "enp5s0"
    ];
  };

  networking.interfaces.br0.useDHCP = true;  
}
