{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprpaper
  ];

  services.hyprpaper = {
    settings = {
      ipc = "on";
    };
  };
}
