{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wine
    opengamepadui
    inputplumber
    vulkan-tools
  ];
}
