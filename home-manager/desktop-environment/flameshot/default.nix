{ config, ... }:
let
  inherit (config.lib.stylix) colors;
in
{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        contrastOpacity = 188;
        contrastUiColor = "#${colors.base01}";
        filenamePattern = "screenshot-%F_%T";
        savePath = "/home/paul/Pictures/Screenshots";
        savePathFixed = true;
        showDesktopNotification = false;
        uiColor = "#${colors.base07}";
        uiLanguage = "en";
        useGrimAdapter = true;
      };
    };
  };
}
