{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-calendar
  ];

  xdg.mimeApps.associations.added = {
    "x-scheme-handler/webcal" = "org.gnome.Calendar.desktop";
    "x-scheme-handler/webcals" = "org.gnome.Calendar.desktop";
  };

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/webcal" = "org.gnome.Calendar.desktop";
    "x-scheme-handler/webcals" = "org.gnome.Calendar.desktop";
    "text/calendar" = "org.gnome.Calendar.desktop";
    "application/x-extension-ics" = "org.gnome.Calendar.desktop";
  };
}
