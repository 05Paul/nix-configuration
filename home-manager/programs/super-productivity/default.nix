{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    super-productivity
  ];
}
