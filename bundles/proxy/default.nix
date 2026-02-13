{ pkgs, ... }:
{
  imports = [
    ../../nixos/features/bootloader/systemd-boot
    ../minimal-server
  ];

  networking = {
    dhcpcd.enable = false;
    useDHCP = false;
    useHostResolvConf = false;
  };

  systemd.network = {
    enable = true;
    networks."50-eth0" = {
      matchConfig.Name = "eth0";
      networkConfig = {
        DHCP = "ipv4";
        IPv6AcceptRA = true;
      };
      linkConfig.RequiredForOnline = "routable";
    };
  };

  environment.systemPackages = with pkgs; [
    cowsay
  ];

  networking.firewall.enable = false;
}
