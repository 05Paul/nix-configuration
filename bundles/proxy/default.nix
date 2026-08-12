{ ... }:
{
  imports = [
    ../incus-vm
  ];

  services.traefik = {
    enable = true;

    staticConfigOptions = {
      accessLog = {};
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

        wings = {
          address = ":8444";
        };

        wings-sftp = {
          address = ":2022";
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
              "192.168.7.0/24"
              "192.168.8.0/24"
            ];
          };

          nextcloud-secure-headers = {
            headers = {
              hostsProxyHeaders = [
                "X-Forwarded-Host"
              ];
              referrerPolicy = "same-origin";
              customRequestHeaders = {
                X-Forwarded-Proto = "https";
              };
            };
          };

          https-redirect = {
            redirectscheme = {
              scheme = "https";
            };
          };
        };

        routers = {
          wings = {
            rule = "Host(`wings.skamrada.dev`)";
            entryPoints = [
              "wings"
            ];

            service = "wings";
            tls = {
              certResolver = "letsencrypt";
            };

          };

          traefik = {
            rule = "Host(`traefik.skamrada.dev`)";
            entryPoints = [
              "websecure"
            ];

            service = "traefik";
            tls = {
              certResolver = "letsencrypt";
            };

            middlewares = [
              "lan-only@file"
            ];

          };

          nextcloud = {
            rule = "Host(`nextcloud.skamrada.dev`)";
            entryPoints = [
              "websecure"
            ];

            service = "nextcloud";
            tls = {
              certResolver = "letsencrypt";
            };

            middlewares = [
              "nextcloud-secure-headers"
              "https-redirect"
            ];
          };
        };

        services = {
          wings.loadBalancer = {
            servers = [
              {
                url = "http://172.16.0.101:8080";
              }
            ];

            passHostHeader = true;
          };

          traefik.loadBalancer = {
            servers = [
              {
                url = "http://172.16.0.100:8080";
              }
            ];
          };

          nextcloud.loadBalancer = {
            servers = [
              {
                url = "http://172.16.0.100:11000";
              }
            ];
          };
        };
      };

      tcp = {
        routers = {
          wings-sftp = {
            rule = "HostSNI(`*`)";
            entryPoints = [
              "wings-sftp"
            ];

            service = "wings-sftp";
          };
        };

        services = {
          wings-sftp.loadBalancer = {
            servers = [
              {
                address = "172.16.0.101:2022";
              }
            ];
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
      "traefik.http.routers.dockge.middlewares" = "lan-only@file";
    };

    environment = {
      DOCKGE_STACKS_DIR = "/opt/stacks";
    };
  };
}
