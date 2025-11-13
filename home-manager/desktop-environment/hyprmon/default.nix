{ pkgs, hyprmon, ...}:
{
  home.packages = [
    hyprmon.packages.${pkgs.stdenv.hostPlatform.system}.hyprmon
  ];
}
