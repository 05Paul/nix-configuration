{ pkgs, ... }:
{
  home.packages = with pkgs; [
    thunderbird
  ];

  xdg.mimeApps.associations.added = {
    "x-scheme-handler/mailto" = "userapp-Thunderbird-ZP7SF3.desktop";
    "x-scheme-handler/mid" = "userapp-Thunderbird-ZP7SF3.desktop";
  };

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/mailto" = "userapp-Thunderbird-ZP7SF3.desktop";
    "message/rfc822" = "userapp-Thunderbird-ZP7SF3.desktop";
    "x-scheme-handler/mid" = "userapp-Thunderbird-ZP7SF3.desktop";
  };
}
