{ ... }: 
{
  imports = [
    ../../flatpak
  ];

  services.flatpak.packages = [
    "org.processing.processingide"
  ];
}
