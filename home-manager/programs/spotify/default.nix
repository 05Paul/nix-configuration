{ pkgs, ... }:
{

  home.packages = [
    pkgs.spotify
    pkgs.spotify-player
  ];

  xdg.desktopEntries = {
    spotify-player = {
      name = "Spotify-Player";
      icon = "spotify";
      comment = "Spotify TUI";
      terminal = false;
      exec = "kitty -e spotify_player";
    };
  };

/*
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      shuffle
    ];
  };
  */
}
