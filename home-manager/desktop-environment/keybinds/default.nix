{ pkgs, ... }:
let
  keybinds = pkgs.writeShellScriptBin "keybinds" (builtins.readFile ./binds);
in
{
  home.packages = with pkgs; [
    keybinds
    rofi
    jq
  ];
}
