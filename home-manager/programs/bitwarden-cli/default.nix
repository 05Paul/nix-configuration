{ pkgs, ...}:
{
  imports = [
    ../seahorse
  ];

  home.packages = with pkgs; [
    bitwarden-cli
  ];
}
