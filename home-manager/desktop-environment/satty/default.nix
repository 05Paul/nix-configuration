{ pkgs-unstable, ... }: {
  home.packages = with pkgs-unstable; [
    satty
    winboat
  ];

  xdg.configFile."satty/config.toml" = {
    source = ./config.toml;
  };
}
