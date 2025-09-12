{ ... }:
{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      gfxmodeEfi = "2560x1440";
    };

    efi = {
      efiSysMountPoint = "/boot";
    };
  };
}
