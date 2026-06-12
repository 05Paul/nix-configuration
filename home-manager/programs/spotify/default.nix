{ pkgs, ... }:
{

  home.packages = [
    pkgs.spotify
    pkgs.spotify-player
  ];

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
