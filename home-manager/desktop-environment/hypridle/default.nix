{ ... }:
{
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
          on-timeout = "brightnessctl set 10";
          on-resume = "brightnessctl -r";
        }

        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }

        {
          timeout = 330;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
        }

        {
          timeout = 600;
          on-timeout = ''
            bash -c 'if [ "$(loginctl show-session $(loginctl show-seat seat0 --value -p ActiveSession) --value -p TTY)" = "$(ps -o tty= -p $(pidof Hyprland | head -n 1) | tr -d " ")" ]; then systemctl suspend; fi'
          '';
        }
      ];
    };
  };
}
