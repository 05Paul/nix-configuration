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

  xdg.desktopEntries.keybinds = {
    name = "Keybinds";
    comment = "Show keybinds";
    exec = "keybinds";
    terminal = false;
  };
}
