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

      certificatesResolvers = {
        letsencrypt.acme = {
          email = "pl.skamrada+letsencrypt@gmail.com";
          storage = "/var/lib/traefik/acme.json";
          httpChallenge.entryPoint = "web";
        };
      };

      entryPoints = {
        web = {
          address = ":80";
        };

        websecure = {
          address = ":443";
        };
      };

      providers = {
        docker = {};
      };
    };

    dynamicConfigOptions = {
      http = {
        middlewares = {
          lan-only = {
            ipAllowList.sourceRange = [
              "172.16.0.0/16"
              "172.31.0.0/16"
              "192.168.8.0/24"
            ];
          };
        };

        routers = {
          router = {
            rule = "Host(`router.skamrada.dev`)";
            entryPoints = [
              "websecure"
            ];

            middlewares = [
              "lan-only"
            ];

            service = "router";
            tls = {
              certResolver = "letsencrypt";
            };

          };
        };

        services = {
          router.loadBalancer = {
            servers = [
              {
                url = "http://192.168.8.1:80";
              }
            ];

            passHostHeader = true;
          };
        };
      };
    };
  };

  users.users.traefik.extraGroups = [
    "docker"
  ];

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

    labels = {
      "traefik.enable" = "true";
      "traefik.http.routers.dockge.rule" = "Host(`dockge.skamrada.dev`)";
      "traefik.http.routers.dockge.entrypoints" = "websecure";
      "traefik.http.routers.dockge.tls" = "true";
      "traefik.http.routers.dockge.tls.certresolver" = "letsencrypt";
    };

    environment = {
      DOCKGE_STACKS_DIR = "/opt/stacks";
    };
  };
}
