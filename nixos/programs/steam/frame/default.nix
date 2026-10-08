{ pkgs, ... }:
{

  boot = {
    kernelPackages = pkgs.linuxPackages_7_2; # HACK: required for steam frame until default kernel >= 7.0
    extraModprobeConfig = ''
      options cfg80211 ieee80211_regdom=AT
    '';
  };

  hardware = {
    steam-hardware.enable = true;
    wirelessRegulatoryDatabase = true;
  };
}
