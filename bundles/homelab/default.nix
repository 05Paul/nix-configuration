{ ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ../../nixos/features/bootloader/systemd-boot
      ../minimal-server
    ];

  networking.networkmanager.enable = true;
  networking.bridges.br0.interfaces = [
    "enp42s0"
  ];

  networking.interfaces = {
    br0.useDHCP = true;
    enp42s0.useDHCP = false;
  };
  
  networking.firewall.enable = false;

  virtualisation.incus = {
    enable = true;
    ui.enable = true;
  };
}
