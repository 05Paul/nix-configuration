{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl
  ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        before_sleep_cmd = "loginctl lock-session";
        lock_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        {
          timeout = 150;
          on_timeout = "brightnessctl -s set 10";
          on_resume = "brightnessctl -r";
        }

        {
          timeout = 300;
          on_timeout = "loginctl lock-session";
        }

        {
          timeout = 330;
          on_timeout = "hyprctl dispatch dpms off";
          on_resume = "hyprctl dispatch dpms on && brightnessctl -r";
        }

        {
          timeout = 600;
          on_timeout = "systemctl suspend";
        }
      ];
    };
  };
}
