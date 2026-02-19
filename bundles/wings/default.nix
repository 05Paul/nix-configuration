{ ... }:
{
  imports = [
    ../incus-vm
  ];

  virtualisation.docker.enable = true;
  virtualisation.oci-containers.backend = "docker";

  virtualisation.oci-containers.containers.wings = {
    image = "ghcr.io/pterodactyl/wings:latest";
    autoStart = true;

    ports = [
      "8080:8080"
      "2022:2022"
    ];

    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
      "/var/lib/docker/containers/:/var/lib/docker/containers/"
      "/etc/pterodactyl/:/etc/pterodactyl/"
      "/var/lib/pterodactyl/:/var/lib/pterodactyl/"
      "/var/log/pterodactyl/:/var/log/pterodactyl/"
      "/tmp/pterodactyl/:/tmp/pterodactyl/"
      "/etc/ssl/certs:/etc/ssl/certs:ro"
	  "/run/wings:/run/wings"
    ];

    environment = {
      TZ = "UTC";
      WINGS_UID = 988;
      WINGS_GID = 988;
      WINGS_USERNAME = "pterodactyl";
    };
  };

}
