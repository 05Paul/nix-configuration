{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sbctl
  ];

  boot.loader = {
    limine = {
      enable = true;
      maxGenerations = 5;
      secureBoot.enable = true;
      style = {
        graphicalTerminal = {
          font = {
            scale = "3x3";
          };
        };
      };
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    grub.enable = false;
    systemd-boot.enable = false;
  };
}
