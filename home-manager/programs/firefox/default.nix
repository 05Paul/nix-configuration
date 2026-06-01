{ config, ... }:
{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    profiles = {
      paul = {
      };
    };
  };

  stylix.targets.firefox.profileNames = [ "paul" ];
}
