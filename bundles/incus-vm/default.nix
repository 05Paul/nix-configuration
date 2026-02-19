{ pkgs, ...}:
{
  imports = [
    ../minimal-server
    ../../nixos/features/bootloader/systemd-boot
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

    wait-online = {
      enable = true;
      anyInterface = true;
      timeout = 10;
    };
  };

  environment.systemPackages = with pkgs; [
  ];

  networking.firewall.enable = false;
}
