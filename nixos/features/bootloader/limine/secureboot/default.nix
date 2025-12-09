{ ... }: 
{#
  imports = [
    ../../limine
  ];

  boot.loader.limine.secureBoot = {
    enable = true;
  };
}
