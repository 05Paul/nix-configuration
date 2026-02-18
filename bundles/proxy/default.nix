{ pkgs, ... }:
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

  services.traefik = {
    enable = true;

    staticConfigOptions = {
      api = {
        insecure = true;
      };

      providers = {
        docker = {};
      };
    };
  };

  virtualisation.docker.enable = true;
  virtualisation.oci-containers.backend = "docker";

  virtualisation.oci-containers.containers.dockge = {
    image = "louislam/dockge:1";
    autoStart = true;

    ports = [
      "5001:5001"
    ];

    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
      "./data:/app/data"
      "/opt/stacks:/opt/stacks"
    ];

    environment = {
      DOCKGE_STACKS_DIR = "/opt/stacks";
    };
  };
}
