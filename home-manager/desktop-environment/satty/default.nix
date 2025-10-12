{ pkgs-unstable, ... }: {
  home.packages = with pkgs-unstable; [
    satty
  ];

  xdg.configFile."satty/config.toml" = {
    source = ./config.toml;
  };
}
