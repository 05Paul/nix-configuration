{ ... }:
{
  services.meshcentral = {
    enable = true;
    settings = {
      settings = {
        Port = 8443;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    8443
  ];
}
