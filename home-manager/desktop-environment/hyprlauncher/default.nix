{ ... }:
{
  services.hyprlauncher = {
    enable = true;
    settings = {
      cache = {
        enabled = true;
      };

      finders = {
        desktop_icons = true;
      };

      general = {
        grab_focus = true;
      };

      ui = {
        window_size = "800 600";
      };
    };
  };
} 
